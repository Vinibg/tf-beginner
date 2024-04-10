module "ec2_securty_groups" {
    source = "terraform-aws-modules/security-group/aws"

    name = local.ec2_securty_groups.name
    description = local.ec2_securty_groups.description
    vpc_id = local.ec2_securty_groups.vpc_id

    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["https-443-tcp", "http-80-tcp"]
    egress_cidr_blocks  = ["0.0.0.0/0"]
    egress_rules        = ["all-all"]

}

module "rds_securty_groups" {
    source = "terraform-aws-modules/security-group/aws"

    name = local.rds_securty_groups.name
    description = local.rds_securty_groups.description
    vpc_id = local.rds_securty_groups.vpc_id

    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["postgresql-tcp"]
    egress_cidr_blocks  = ["0.0.0.0/0"]
    egress_rules        = ["all-all"]

}