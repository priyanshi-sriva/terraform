# Create security group for the Application Load Balancer

resource "aws_security_group" "create-sg" {
   name = "sg_load-balancer"
   vpc_id = "${var.vpc}"
   ingress {
       from_port = "80"
       to_port = "80"
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
       from_port = "443"
       to_port = "443"
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }
   egress{
        from_port         = 0
        to_port           = 0
        protocol          = "-1"
        cidr_blocks       = ["0.0.0.0/0"]
   }
   tags = {
       Name = "alb_sg"
   }
}


resource "aws_alb" "alb" {
   name               = "ALB"
   internal           = "true"
   vpc_id      = "${var.vpc}"
   security_groups = [
   "${aws_security_group.create-sg.id}"
 ]
 load_balancer_type = "application"
 idle_timeout       = "300"
 subnets            = ["${var.subnet_id_1}", "${var.subnet_id_2}"]
 ip_address_type    = "ipv4"
 enable_deletion_protection = false
 enable_http2               = true

}

resource "aws_lb_target_group" "target_group" {
 name        = "targetgroup"
 vpc_id      = "${var.vpc}"
 port        = 80
 protocol    = "HTTP"
 target_type = "instance"

stickiness {
   type    = "lb_cookie"
   enabled = "true"
 }

 health_check {
   healthy_threshold   = 2
   unhealthy_threshold = 2
   timeout             = 5
   path                = "/"
   protocol            = "HTTP"
 }

}

resource "aws_lb_target_group_attachment" "tg-attach" {
  target_group_arn = "${aws_lb_target_group.target_group.arn}"
  target_id        = "${var.instance-id}"
  port             = 80
}
