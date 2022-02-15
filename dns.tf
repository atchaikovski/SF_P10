
resource "aws_route53_record" "vm1" {
  zone_id = data.aws_route53_zone.link.zone_id
  name    = var.vm1_host_name
  type    = "A"
  ttl     = "300"
  records = [aws_eip.vm1_static_ip.public_ip]
}

resource "aws_route53_record" "vm2" {
  zone_id = data.aws_route53_zone.link.zone_id
  name    = var.vm2_host_name
  type    = "A"
  ttl     = "300"
  records = [aws_eip.vm2_static_ip.public_ip]
}

resource "aws_route53_record" "vm3" {
  zone_id = data.aws_route53_zone.link.zone_id
  name    = var.vm3_host_name
  type    = "A"
  ttl     = "300"
  records = [aws_eip.vm3_static_ip.public_ip]
}
