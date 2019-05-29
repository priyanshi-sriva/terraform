module "ec2" {
    source = "./modules/ec2"
    ami = "${var.ami}"
    key_name = "${var.key_name}"
    vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
    vpc = "${var.vpc}"
}

module "alb"{

    source = "./modules/alb"
    vpc = "${var.vpc}"
    security_group = "${module.ec2.security_group}"
    subnet_id_1 = "${var.subnet_id_1}"
    subnet_id_2 = "${var.subnet_id_2}"
    instance-id = "${module.ec2.instanceid}"
}
