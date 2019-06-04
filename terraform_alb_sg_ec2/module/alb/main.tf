resource "aws_lb" "this" {
  #name               = "${var.env}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.sg_id_alb}"]
  subnets            = "${var.alb_subnet_ids}"
  tags               = "${var.tags}"
}

resource "aws_lb_target_group" "this" {
  #name        = "${var.env}"
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
  target_id        = "${var.instance_id}"
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


