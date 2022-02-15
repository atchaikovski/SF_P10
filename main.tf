# ------------------- EC2 resources ---------------------------------

resource "aws_instance" "nginx" {
  ami                         = "ami-0e472ba40eb589f49" # ubuntu
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = "aws_adhoc"
  count                       = var.nginx_count
  associate_public_ip_address = true
  availability_zone           = var.az

  tags = { 
    Name = "nginx Server # ${count.index}"
  }

}

# --------------- write inventory file ---------------------

 resource "local_file" "inventory" {
	  content = templatefile("${path.module}/hosts.tpl", {
       		list_nginx = slice(aws_instance.nginx.*.public_ip, 0, var.nginx_count),
	  })
	  filename = "inventory"
	}

# --------- launch Ansible to deploy k8s on these resources ---------


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

# --------------- get static IP addresses ------------------

resource "aws_eip" "nginx_static_ip" {
  instance = aws_instance.nginx[0].id
  vpc = true
  tags = { 
    Name = "nginx Server IP" 
  }
}
