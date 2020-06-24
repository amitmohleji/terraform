
provider "aws" {
  profile = "default"
  region  = var.region
}

module "ec2_instances" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "amitsinstance"
  instance_count         = 1

  ami                    = var.ami
  instance_type          = "t2.micro"
  key_name               = "amit-us-east-2"
  monitoring             = true
  vpc_security_group_ids = ["sg-0bf0ac44d93db2b15"]
  subnet_id              = "subnet-0a9de645ef022746e"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ansible_provisioner" {
  source    = "github.com/cloudposse/tf_ansible"

  arguments = ["--user=ubuntu -i ../hosts"]
  envs      = ["host=${module.ec2_instances.public_ip[0]}"]
  playbook  = "./ansible/tomcat.yml"
  dry_run   = false

}