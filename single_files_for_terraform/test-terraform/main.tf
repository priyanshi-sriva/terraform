# EC2

resource "aws_instance" "this" {
  ami                     = "${var.ami_id}"
 # vpc                     = "${var.vpc_id}"
  subnet_id               = "${var.ec2_subnet_id}"
  instance_type           = "${var.instance_type}"
  vpc_security_group_ids  = ["${aws_security_group.ec2.id}"]
 # ebs_optimized           = "false"
  associate_public_ip_address = "true"
  key_name                = "${var.key_name}" 
  tags                    = "${merge(map("Name", "${var.env}"), var.tags)}"
  volume_tags             = "${merge(map("Name", "${var.env}"), var.tags)}"
  #disable_api_termination = "${var.data_protection}"

  root_block_device {
    volume_size           = "${var.volume_size}"
    #delete_on_termination = "${var.data_protection ? false : true}"
  }
}

resource "aws_key_pair" "deployer" {
  key_name = "${var.key_name}"
  public_key = "${var.public_key}"
}


# ALB

resource "aws_lb" "this" {
  name               = "${var.env}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb.id}"]
  subnets            = ["${var.subnet_id_1}","${var.subnet_id_2}"]
  tags               = "${var.tags}"


}

resource "aws_lb_target_group" "this" {
  name        = "${var.env}"
  port        = "${var.port}"
  protocol    = "${var.protocol}"
  target_type = "instance"
  vpc_id      = "${var.vpc_id}"
  

  health_check {
    path = "/"
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = "${aws_lb_target_group.this.arn}"
  target_id        = "${aws_instance.this.id}"
  port             = "${var.port}"
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = "${aws_lb.this.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# Security Groups

resource "aws_security_group" "ec2" {
  name_prefix = "${var.env}-ec2-"
  vpc_id      = "${var.vpc_id}"
  tags        = "${merge(map("Name", "${var.env}-ec2"), var.tags)}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "alb" {
  name_prefix = "${var.env}-alb-"
  vpc_id      = "${var.vpc_id}"
  tags        = "${merge(map("Name", "${var.env}-alb"), var.tags)}"

  lifecycle {
    create_before_destroy = true
  }
}
# Ingress

resource "aws_security_group_rule" "ec2_ingress_ec2" {
  description              = "Self ingress"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.ec2.id}"
  source_security_group_id = "${aws_security_group.ec2.id}"
}

resource "aws_security_group_rule" "ec2_ingress_alb" {
  description              = "ALB ingress"
  type                     = "ingress"
  from_port                = "${var.port}"
  to_port                  = "${var.port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ec2.id}"
  source_security_group_id = "${aws_security_group.alb.id}"
}

resource "aws_security_group_rule" "alb_ingress_http" {
  description       = "HTTP ingress"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.alb.id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_ingress_https" {
  description       = "HTTPS ingress"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.alb.id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Egress

resource "aws_security_group_rule" "ec2_egress_all" {
  description       = "Full egress"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.ec2.id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_egress_ec2" {
  description              = "EC2 egress"
  type                     = "egress"
  from_port                = "${var.port}"
  to_port                  = "${var.port}"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.alb.id}"
  source_security_group_id = "${aws_security_group.ec2.id}"
}
