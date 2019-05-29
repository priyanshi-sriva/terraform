output "alb_arn" {
 value = "${aws_alb.alb.arn}"
}

output "alb_id" {
 value = "${aws_alb.alb.id}"
}

output "alb_dns_name" {
 value = "${aws_alb.alb.dns_name}"
}

output "tg_arn" {
 value = "${aws_lb_target_group.target_group.arn}"
}

