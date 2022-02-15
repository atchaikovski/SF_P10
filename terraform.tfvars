region                     = "us-east-1"
instance_type              = "t2.small"
enable_detailed_monitoring = true

private_key  =  "~/.ssh/aws_adhoc.pem"
public_key   =  "~/.ssh/aws_adhoc.pub"

common_tags   = {
  Owner       = "Alex Tchaikovski"
  Project     = "Skill factory Project 10"
  Purpose     = ""
}

ubuntu_host_name = "vm"
ubuntu_count = 2
centos_host_name = "centos"
centos_count = 1

az           = "us-east-1a"