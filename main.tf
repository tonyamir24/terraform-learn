provider "aws" {}

variable "subnet_cidr_block"{
    description = "subnet cidr block"
    default = "10.0.10.0/24"
    type = string
}



resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name: var.environment
    }
}           

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "development"
    availability_zone = "eu-west-3a"
    tags = {
        Name: "subnet-1-dev"
    }
}

output  "dev-vpc-id" {
    value = aws_vpc.development-vpc.id

}

output  "dev-subnet-id" {
    value = aws_subnet.dev-subnet-1.id
    
}