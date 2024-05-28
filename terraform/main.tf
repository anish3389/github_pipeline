module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "5.5.0"
  instance_type               = var.instance_type
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

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = var.bucket_name
}

resource "aws_s3_object" "file_upload" {
  bucket = module.s3_bucket.s3_bucket_id
  key    = "index.html"
  source = "../code/index.html"
  etag   = "${filemd5("../code/index.html")}"
}
