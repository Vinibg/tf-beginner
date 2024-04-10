module "rds" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  depends_on = [module.rds_securty_groups]

  name           = local.rds.name
  engine         = local.rds.engine
  engine_version = local.rds.engine_version
  instance_class = local.rds.instance_class
  instances = {
    instance-1 = {
      instance_class             = local.rds.instance_class
      auto_minor_version_upgrade = true
      publicly_accessible        = false
      promotion_tier             = "1"
    }
  }
  master_username = "postgres"
  master_password = "postg"

  vpc_id               = local.rds.vpc_id
  db_subnet_group_name = local.rds.db_subnet_group_name
  vpc_security_group_ids = [module.rds_securty_groups.security_group_id]

  storage_encrypted   = false
  apply_immediately   = true
  skip_final_snapshot = true

  create_db_cluster_parameter_group      = true
  db_cluster_parameter_group_name        = local.rds.name
  db_cluster_parameter_group_family      = "aurora-postgresql15"
  db_cluster_parameter_group_description = "${local.rds.name} cluster parameter group"

  create_db_parameter_group      = true
  db_parameter_group_name        = local.rds.name
  db_parameter_group_family      = "aurora-postgresql15"
  db_parameter_group_description = "${local.rds.name} DB parameter group"

}