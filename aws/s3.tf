module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = local.s3.bucket
  acl    =  local.s3.acl

  control_object_ownership = true
  object_ownership         =  local.s3.object_ownership

}