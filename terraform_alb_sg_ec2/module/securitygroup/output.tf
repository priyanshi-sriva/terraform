output "sg_id_ec2" {
  value = "${aws_security_group.ec2.id}"
}
output "sg_id_alb" {
  value = "${aws_security_group.alb.id}"
}
