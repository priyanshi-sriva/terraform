variable "env" {
  description = "Unique name of your Terraform environment to be used for naming and tagging resources"
  type = "string"
}

variable "vpc_id" {
  description = "Id of the VPC to which your AMI will be deployed"
  default = "vpc-04114ed591b750e9a"
}

variable "tags" {
  description = "Additional tags to be applied to all resources"
  default     = {}
}

variable "port" {
  
}