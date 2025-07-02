provider "aws" {
    region = "us-east-1"
}

variable "ami_value" {
    description = "AMI value for server"
}

variable "instance_type_value" {
    description = "Instance type value"
}

variable "server_name" {
    description = "Server name tag"
}

resource "aws_instance" "test-server" {
    ami = var.ami_value
    instance_type = var.instance_type_value

    tags = {
      Name = var.server_name
    }
}