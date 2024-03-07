/*
Create the S3 bucket
*/
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucketname

  tags = var.tags
}

