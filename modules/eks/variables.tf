variable "environment" {

type = string

}


variable "cluster_role_arn" {

type = string

}


variable "node_role_arn" {

type = string

}


variable "private_subnets" {

type = list(string)

}


variable "cluster_security_group_id" {

type = string

}