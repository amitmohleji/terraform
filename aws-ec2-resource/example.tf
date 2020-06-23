variable "region" {
	default = "us-east-1"
}

variable "ami" {
	default = "ami-09d95fab7fff3776c"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = "t2.micro"
}

output "ip" {
	value = aws_instance.example.public_ip
}
output "id" {
	value = aws_instance.example.id
}