region                      = "us-east-1"
owner                       = "anish.sapkota"
silo                        = "intern"
project                     = "ansible-nginx-server"
terraform                   = true
ami_id                      = "ami-012485deee5681dc0"
associate_public_ip_address = true
ssm_policy                  = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
instance_type               = "t2.micro"
sg_id                       = ["sg-0b58f156501701642"]
# private_subnet_id                   = "subnet-0f97b0bb45cdeb3b7"
# private_subnet_id   = "subnet-094222bc07bb63e74"
create_iam_instance_profile = true
monitoring                  = true

name   = "ansible_anish_public"
subnet_id = "subnet-0f97b0bb45cdeb3b7"
