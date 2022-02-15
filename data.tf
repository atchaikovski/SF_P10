data "aws_vpc" "default" {}

data "aws_route53_zone" "link" {
  name         = "tchaikovski.link."
  private_zone = false
}