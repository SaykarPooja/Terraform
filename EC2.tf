provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "test_ec2" {
    count = 3
  ami           = "ami-0f5ee92e2d63afc18"   # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-test-ec2${count.index+1}"
  }
}
