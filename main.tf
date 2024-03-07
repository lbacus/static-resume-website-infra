module "aws_s3_bucket" {
  source = "./modules/s3_bucket"

  bucketname = "terraform-s3-module"

  tags = {
    Name        = "test bucket"
    Environment = "Dev"
  }
}

module "s3_bucket_public_config" {
  source = "./modules/s3_bucket_public_config"

  bucketID = module.aws_s3_bucket.id

  fileSuffix = "index.html"

}