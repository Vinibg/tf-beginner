module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  depends_on = [module.ec2_securty_groups]
  name = "api-backend"

  instance_type          = local.ec2.instance_type
  key_name               = local.ec2.key_name
  monitoring             = true
  vpc_security_group_ids = [module.ec2_securty_groups.security_group_id]
  ami = local.ec2.ami
}