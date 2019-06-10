## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_id | AMI that will be launched | string | n/a | yes |
| ec2\_subnet\_id | Subnet(s) to which the EC2 instance will be deployed | string | `"subnet-0aa540f974f6cdd3b"` | no |
| env | Unique name of your Terraform environment to be used for naming and tagging resources | string | n/a | yes |
| instance\_type | EC2 instance type | string | `"t2.medium"` | no |
| key\_name | Enter key name for instance | string | n/a | yes |
| port | Port of the EC2 instance to which the ALB will forward | string | `"8080"` | no |
| protocol | Protocol running on the port to which the ALB will forward | string | `"HTTP"` | no |
| public\_key | enter public key | string | n/a | yes |
| subnet\_id\_1 | (required) Subnet(s) to which the ALB will be deployed | string | `"subnet-0aa540f974f6cdd3b"` | no |
| subnet\_id\_2 | subnet for alb | string | `"subnet-052454610f0834ff4"` | no |
| tags | Additional tags to be applied to all resources | map | `<map>` | no |
| volume\_size | https://www.terraform.io/docs/providers/aws/r/instance.html#volume_size | string | `"50"` | no |
| vpc\_id | Id of the VPC to which your AMI will be deployed | string | `"vpc-04114ed591b750e9a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| sg\_id | Security group ID for the EC2 instance |

