## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alb\_subnet\_ids | (required) Subnet(s) to which the ALB will be deployed | list | n/a | yes |
| ami\_id | AMI that will be launched | string | n/a | yes |
| ec2\_subnet\_id | Subnet(s) to which the EC2 instance will be deployed | string | n/a | yes |
| env | Unique name of your Terraform environment to be used for naming and tagging resources | string | `"test"` | no |
| instance\_id | instance_id of the ec2 instance | string | `""` | no |
| instance\_type | EC2 instance type | string | `"t2.micro"` | no |
| key\_name | Enter key name for instance | string | n/a | yes |
| port | Port of the EC2 instance to which the ALB will forward | string | `"8080"` | no |
| protocol | Protocol running on the port to which the ALB will forward | string | `"HTTP"` | no |
| public\_key | enter public key | string | n/a | yes |
| sg\_id\_alb | sg for alb | string | `""` | no |
| sg\_id\_ec2 | sg for ec2 | string | `""` | no |
| tags | Additional tags to be applied to all resources | map | `<map>` | no |
| volume\_size | size of the volume attached with ec2 | string | `"50"` | no |
| vpc\_id | Id of the VPC to which your AMI will be deployed | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id |  |
| sg\_id\_alb |  |
| sg\_id\_ec2 |  |



/MODULE/ALB


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alb\_subnet\_ids | Subnets to which albs will be deployed | list | n/a | yes |
| env | Unique name of your Terraform environment to be used for naming and tagging resources | string | `"test"` | no |
| instance\_id |  | string | n/a | yes |
| port | Port of the EC2 instance to which the ALB will forward | string | `"8080"` | no |
| protocol | Protocol running on the port to which the ALB will forward | string | `"HTTP"` | no |
| sg\_id\_alb | security group id of alb | string | `""` | no |
| subnets |  | list | n/a | yes |
| tags |  | string | n/a | yes |
| vpc\_id | Id of the VPC to which your AMI will be deployed | string | `""` | no |







/MODULE/EC2

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_id | AMI that will be launched | string | n/a | yes |
| ec2\_subnet\_id |  | string | n/a | yes |
| env | Unique name of your Terraform environment to be used for naming and tagging resources | string | n/a | yes |
| instance\_type | EC2 instance type | string | `"t2.micro"` | no |
| key\_name |  | string | n/a | yes |
| public\_key |  | string | n/a | yes |
| sg\_id\_ec2 |  | string | n/a | yes |
| tags | Additional tags to be applied to all resources | map | `<map>` | no |
| volume\_size |  | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id |  |




/MODULE/SECURITYGROUP


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| env | Unique name of your Terraform environment to be used for naming and tagging resources | string | n/a | yes |
| port |  | string | n/a | yes |
| tags | Additional tags to be applied to all resources | map | `<map>` | no |
| vpc\_id | Id of the VPC to which your AMI will be deployed | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| sg\_id\_alb |  |
| sg\_id\_ec2 |  |

