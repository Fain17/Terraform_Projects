provider "aws" {
    region = "us-east-1"
}

module "ec2-instance" {
    source = "./modules/ec2_instances"
    ami_value = var.ami_value
    instance_type_value = lookup(var.instance_type_value, terraform.workspace, "t2.micro")
    server_name = lookup(var.server_name, terraform.workspace, "basic-server")
}