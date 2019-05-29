output "security_group"{

value = "${aws_security_group.security_group.id}"
}

output "instanceid"{

value = "${aws_instance.ec2.id}"
}
