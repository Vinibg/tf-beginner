locals {
  ec2 = {
    name = "api-backend"
    instance_type  = "t2.micro"
    key_name = var.ec2_key_par
    ami = "ami-080e1f13689e07408"

  }
  rds = {
    name = "rds-postgres"
    engine  = "aurora-postgresql"
    engine_version = "15.4"
    instance_class = "db.t3.medium"
    vpc_id = var.vpc_id
    db_subnet_group_name = var.db_subnet_group_name
  }
  ec2_securty_groups = {
    name = "ec2-sg"
    description = "Security group for web server with HTTP ports open"
    vpc_id = var.vpc_id
  }
  rds_securty_groups = {
    name = "Rds Security Group"
    description = "Security group for postgress rds"
    vpc_id = var.vpc_id
  }
  s3 = {
    bucket = var.s3_bucket_name
    acl = "private"
    object_ownership = "ObjectWriter"
  }
}
