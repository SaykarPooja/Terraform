provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "test_ec2" {
    count = 3
  ami           = var.instance_image   # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-test-ec2${count.index+1}"
  }
}
