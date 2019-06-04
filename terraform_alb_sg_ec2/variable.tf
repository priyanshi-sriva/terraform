variable "env" {
  description = "Unique name of your Terraform environment to be used for naming and tagging resources"
  type = "string"
  default = "test"
}

variable "tags" {
  description = "Additional tags to be applied to all resources"
  default     = {}
}

variable "vpc_id" {
  description = "Id of the VPC to which your AMI will be deployed"
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

variable "alb_subnet_ids" {
 description = "(required) Subnet(s) to which the ALB will be deployed"
 type = "list"
}

# variable "subnet_id_1" {
#   description = "(required) Subnet(s) to which the ALB will be deployed"
#   default = ""
# }

# variable "subnet_id_2" {
#   description = "(required) Subnet(s) to which the ALB will be deployed"
#   default = """
# }
variable "ec2_subnet_id" {
  description = "Subnet(s) to which the EC2 instance will be deployed"
  type = "string"
}

variable "volume_size" {
  description = "size of the volume attached with ec2"
  default     = "50"
}

variable "instance_id" {
  description = "instance_id of the ec2 instance"
  default = ""
}

variable "sg_id_ec2" {
  description = "sg for ec2"
  default = ""
}

variable "sg_id_alb" {
  description = "sg for alb"
  default = ""
}
