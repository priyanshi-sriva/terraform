variable "tags" {
  description = "Additional tags to be applied to all resources"
  default     = {}
}

#variable "vpc_id" {
#  description = "Id of the VPC to which your AMI will be deployed"
# default = "vpc-04114ed591b750e9a"
#}

variable "env" {
  description = "Unique name of your Terraform environment to be used for naming and tagging resources"
  type = "string"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI that will be launched"
  type = "string"
}

variable "ec2_subnet_id" {
  
}

variable "key_name" {

}

variable "public_key" {

}
variable "volume_size" {
}
variable "sg_id_ec2" {

}
# variable "user_data" {
#   default = "echo 'user_data' >> authorised_keys"
# }
