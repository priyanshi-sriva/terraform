variable "env" {
  description = "Unique name of your Terraform environment to be used for naming and tagging resources"
  type = "string"
}

variable "tags" {
  description = "Additional tags to be applied to all resources"
  default     = {}
}

variable "vpc_id" {
  description = "Id of the VPC to which your AMI will be deployed"
  default = "vpc-04114ed591b750e9a"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "ami_id" {
  description = "AMI that will be launched"
  type = "string"
}

variable "port" {
  description = "Port of the EC2 instance to which the ALB will forward"
  default     = "8080"
}

variable "protocol" {
  description = "Protocol running on the port to which the ALB will forward"
  default     = "HTTP"
}

variable "key_name"{
  description = "Enter key name for instance"
  type = "string"
}

variable "public_key" {
  description = "enter public key"
  type = "string"
}

#variable "alb_subnet_ids" {
#  description = "(required) Subnet(s) to which the ALB will be deployed"
#  type = "list"
#}

variable "subnet_id_1" {
  description = "(required) Subnet(s) to which the ALB will be deployed"
  default = "subnet-0aa540f974f6cdd3b"
}

variable "subnet_id_2" {
  description = "subnet for alb"
  default = "subnet-052454610f0834ff4"
}
variable "ec2_subnet_id" {
  description = "Subnet(s) to which the EC2 instance will be deployed"
  default     = "subnet-0aa540f974f6cdd3b"
}

variable "volume_size" {
  description = "https://www.terraform.io/docs/providers/aws/r/instance.html#volume_size"
  default     = "50"
}

