provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAV***********"
  secret_key = "jRP******************R"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "terraform-test-bucket-123456-pooja"  # must be globally unique

  tags = {
    Name        = "terraform-test-bucket"
    Environment = "Dev"
  }
}
