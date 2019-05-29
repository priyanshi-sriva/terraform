resource "aws_security_group" "security_group" {
    tags= {
       Name = "terraform"
    }
    ingress {
        from_port = "8080"
        to_port = "8080"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_instance" "ec2" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  associate_public_ip_address = "true"
  #vpc = "${var.vpc}"
  security_groups = "${aws_security_group.security_group.id}"
  vpc_security_group_ids = ["sg-010dd2d97351d3c71"]
  tags ={
    owner = ""
    createdby = ""
    Application = ""
    createdon = ""
  }
  
}

