resource "aws_vpc" "myvpc" {
    cidr_block = var.cidr
    tags = {
      name="MYVPC"
    }
}
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.myvpc.id
   cidr_block = "10.0.0.0/24"
   availability_zone = "ap-south-1a"
   map_public_ip_on_launch = true
}
resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.myvpc.id
   cidr_block = "10.0.1.0/24"
   availability_zone = "ap-south-1b"
   map_public_ip_on_launch = true
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
}
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
   subnet_id      = aws_subnet.sub1.id
   route_table_id = aws_route_table.route.id
}
resource "aws_route_table_association" "rta2" {
   subnet_id      = aws_subnet.sub2.id
   route_table_id = aws_route_table.route.id
}
resource "aws_security_group" "sg" {
  name_prefix = "aws_sg"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "s3" {
  bucket = "awsbtspooja3"  
}
resource "aws_instance" "server1" {
  ami= "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.sub1.id  
}
resource "aws_instance" "server2" {
  ami= "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.sub2.id  
}
