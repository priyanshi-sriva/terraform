output "instance_id" {
  value = "${module.ec2.instance_id}"
}

output "sg_id_alb" {
  value = "${module.securitygroup.sg_id_alb}"
}

output "sg_id_ec2" {
    value = "${module.securitygroup.sg_id_ec2}"
}
