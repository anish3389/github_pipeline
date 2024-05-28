# Argument Reference for the resources
################################################################################

variable "region" {
  description = "Region be used for all the resources"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "ansible_intro"
}

variable "terraform" {
  description = "Name to be used on all the resources as identifier"
  type        = bool
  default     = true
}

variable "owner" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "silo" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}


variable "ami_id" {}
variable "instance_type" {}
variable "sg_id" {}
variable "subnet_id" {}
variable "monitoring" {}
variable "associate_public_ip_address" {}
variable "create_iam_instance_profile" {}
variable "ssm_policy" {}
variable "name" {}
variable "bucket_name" {}