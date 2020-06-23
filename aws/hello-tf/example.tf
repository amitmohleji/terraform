variable "region" {
	default = "us-east-1"
}

variable "ami" {
	default = "ami-09d95fab7fff3776c"
}


output "ip" {
	value = var.region
}
output "id" {
	value = var.ami
}