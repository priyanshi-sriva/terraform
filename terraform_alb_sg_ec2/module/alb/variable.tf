variable "env" {
  description = "Unique name of your Terraform environment to be used for naming and tagging resources"
  type = "string"
  default = "test"
}

variable "vpc_id" {
  description = "Id of the VPC to which your AMI will be deployed"
  default = "vpc-04114ed591b750e9a"
}

variable "port" {
  description = "Port of the EC2 instance to which the ALB will forward"
  default     = "8080"
}

variable "protocol" {
  description = "Protocol running on the port to which the ALB will forward"
  default     = "HTTP"
}
variable "subnets" {
  type = "list"
}

# variable "subnet_id_1" {
#   description = "(required) Subnet(s) to which the ALB will be deployed"
#   default = "subnet-0aa540f974f6cdd3b"
# }

# variable "subnet_id_2" {
#   description = "subnet for alb"
#   default = "subnet-052454610f0834ff4"
# }

variable "alb_subnet_ids" {
  description = "Subnets to which albs will be deployed"
  type = "list"
}

variable "sg_id_alb" {
  description = "security group id of alb"
  default = ""
}

variable "tags" {

}

variable "instance_id" {
     
}