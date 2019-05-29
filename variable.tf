variable "region" {
    default = "us-east-1"
}
variable "ami" {
    default = "ami-0756fbca465a59a30"
    type = "string"
}

variable "vpc" { 
    type = "string"
    
}

variable "subnet_id_1"{
	type = "string"
}

variable "subnet_id_2"{
        type = "string"
}
variable "key_name"{
	type = "string"
}
