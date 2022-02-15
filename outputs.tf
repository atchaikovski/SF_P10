output "vm1_server_ip" {
  value = aws_eip.vm1_static_ip.public_ip
}

output "vm2_server_ip" {
  value = aws_eip.vm2_static_ip.public_ip
}

output "vm3_server_ip" {
  value = aws_eip.vm3_static_ip.public_ip
}