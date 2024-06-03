region                      = "us-east-1"
owner                       = "anish.sapkota"
silo                        = "intern"
project                     = "ansible-nginx-server"
terraform                   = true

name   = "gh_ansible_anish_public"
ami_id                      = "ami-012485deee5681dc0"
instance_type               = "t2.micro"
associate_public_ip_address = true
ssm_policy                  = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
sg_id                       = ["sg-0b58f156501701642"]
subnet_id = "subnet-0f97b0bb45cdeb3b7"
create_iam_instance_profile = true
monitoring                  = true

bucket_name = "pipeline-anish-bucket3"