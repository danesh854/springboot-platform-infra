variable "environment" {}

variable "vpc_cidr" {}


variable "public_subnet_cidrs" {

type = list(string)

}


variable "private_subnet_cidrs" {

type = list(string)

}


variable "azs" {

type = list(string)

}
variable "repository_name" {

type = string

}