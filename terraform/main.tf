module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "5.5.0"
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ssh_key.key_name
  ami                         = var.ami_id
  monitoring                  = var.monitoring
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.sg_id
  subnet_id                   = var.subnet_id
  create_iam_instance_profile = var.create_iam_instance_profile
  iam_role_description        = "SSM Role for accessing EC2 instance"

  iam_role_policies = {
    SSM = var.ssm_policy
  }

  tags = {
    Name = var.name
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "anish_pipeline_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDsbwyYuG8LPv5UorIfpTdHWiO/qo3aOymvr9ALfYGMyXQ/52ySMgENEyVToamRxXh8xyRNuVKhe2rLZkSkS9ulg3SmtuDrFE1XYLy1ou1PQJqSBeI1RwzDa8vBapn3lwufkU5K4pByaYgoXWHoLN9F3SxJ9vMyjgKyB6w8ZOlbILgGQDOfOYnzz/8DlEYbdAB24ZSKPMTK6Zjw8HSQycy/4i12boHSSn99s5sThwP6NFZ8VpFkbAfJBqQ5VgstGkDVhaTIUQMhqUghNKuK5JIn9gKF2jmxSzqGmw8aXfTNY4csrx0lKJtAd2MobDRZL2qeP/gApyNUFRcW+mQRHFMn"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "pipeline-anish-bucket"
}

resource "aws_s3_object" "file_upload" {
  bucket = module.s3_bucket.s3_bucket_id
  key    = "index.html"
  source = "../code/index.html"
  etag   = "${filemd5("../code/index.html")}"
}
