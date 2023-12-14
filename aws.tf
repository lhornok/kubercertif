provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example_server" {
  ami           = "ami-06dd92ecc74fdfb36"
  instance_type = "t2.large"
  key_name      = "website-spotnotify"  # Replace with your actual key pair name
  count = 2

  vpc_security_group_ids = ["website-spotnotify"]  # Replace with your actual security group ID(s)

  root_block_device {
    volume_size = 20  # Set the desired storage size in GB
  }

  tags = {
    Name = "kube"
  }
}