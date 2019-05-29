output "security_group_id"{

  value = "${module.ec2.security_group}"
}

output "instanceid"{
value = "${module.ec2.instanceid}"
}


output "alb_arn"{
 value = "${module.alb.alb_arn}"

}

output "alb_id"{
 value = "${module.alb.alb_id}"

}

output "alb_dns_name" {
 value = "${module.alb.alb_dns_name}"
}


output "tg_arn" {
 value = "${module.alb.tg_arn}"
}
