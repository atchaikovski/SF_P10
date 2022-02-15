# ------------------- EC2 resources ---------------------------------

resource "aws_instance" "vm_ubuntu" {
  ami                         = "ami-0e472ba40eb589f49" # ubuntu
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = "aws_adhoc"
  count                       = var.ubuntu_count
  associate_public_ip_address = true
  availability_zone           = var.az

  tags = { 
    Name = "ubuntu Server # ${count.index}"
  }

}

resource "aws_instance" "vm_centos" {
  ami                         = "ami-0d6e9a57f6259ba3a" # centos 8
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = "aws_adhoc"
  count                       = var.centos_count
  associate_public_ip_address = true
  availability_zone           = var.az

  tags = { 
    Name = "centos Server # ${count.index}"
  }

}

# --------------- write inventory file ---------------------

 resource "local_file" "inventory" {
	  content = templatefile("${path.module}/hosts.tpl", {
       		list_ubuntu = slice(aws_instance.vm_ubuntu.*.public_ip, 0, var.ubuntu_count),
       		list_centos = slice(aws_instance.vm_centos.*.public_ip, 0, var.centos_count),
	  })
	  filename = "inventory"
	}

# --------- launch Ansible to deploy load on these resources ---------

/*
resource "null_resource" "null1" {
  depends_on = [
     local_file.inventory
  ]

  provisioner "local-exec" {
    command = "sleep 60"
  }

  provisioner "local-exec" {
     command = "ansible-playbook -i ./inventory --private-key ${var.private_key} -e 'pub_key=${var.public_key}' playbook.yml"
  }
}
*/

# --------------- get static IP addresses ------------------

resource "aws_eip" "ubuntu0_static_ip" {
  instance = aws_instance.vm_ubuntu[0].id
  vpc = true
  tags = { 
    Name = "nginx Server IP" 
  }
}

resource "aws_eip" "ubuntu1_static_ip" {
  instance = aws_instance.vm_ubuntu[1].id
  vpc = true
  tags = { 
    Name = "nginx Server IP" 
  }
}

resource "aws_eip" "centos0_static_ip" {
  instance = aws_instance.vm_centos[0].id
  vpc = true
  tags = { 
    Name = "nginx Server IP" 
  }
}