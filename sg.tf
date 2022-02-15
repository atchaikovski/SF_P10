# ---------------------- allowed ports --------------------------------------
locals {
  _start = [22, 5432, 8080] # from_ports
  _end   = [22, 5432, 8080] # to_ports
}

# ----------- Security group resources ---------------------------------------

resource "aws_security_group" "sg" {
  name = "B10.9.2 Security Group"

  vpc_id = data.aws_vpc.default.id

  dynamic "ingress" {
    for_each = local._start
    content {
      from_port   = ingress.value
      to_port     = element(local._end, index(local._start,ingress.value))
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { 
    Name = "B10.9.2 SecurityGroup" 
  }

}
