output "vm_ubuntu0_server_ip" {
  value = aws_eip.ubuntu0_static_ip.public_ip
}

output "vm_ubuntu1_server_ip" {
  value = aws_eip.ubuntu1_static_ip.public_ip
}

output "vm_centos_server_ip" {
  value = aws_eip.centos0_static_ip.public_ip
}