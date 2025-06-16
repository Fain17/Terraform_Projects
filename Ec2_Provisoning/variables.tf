variable "ami_value" {
    description = "AMI value of instance "
}

variable "instance_type_value" {
    description = "Instance type value"
    type = map(string)

    default = {
      "dev" = "t2.medium"
      "prod" = "t2.large"
    }

}

variable "server_name" {
    description = "Server name tag"
    type = map(string)

    default = {
      "dev" = "Dev-server"
      "prod" = "Prod-server"
    }
}