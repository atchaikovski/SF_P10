region                     = "us-east-1"
instance_type              = "t2.small"
enable_detailed_monitoring = true

private_key  =  "~/.ssh/aws_adhoc.pem"
public_key   =  "~/.ssh/aws_adhoc.pub"

common_tags = {
  Owner       = "Alex Tchaikovski"
  Project     = "Skill factory B10.9.2 homework"
  Purpose     = ""
}

nginx_host_name = "www"
nginx_count = 1

az           = "us-east-1a"