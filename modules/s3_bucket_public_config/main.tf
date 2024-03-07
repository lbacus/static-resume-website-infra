/*
Once the S3 bucket has been created, configure that S3 bucket (via referencing)
to route to the index document for the website (the html file name)
*/
resource "aws_s3_bucket_website_configuration" "bucket_web_config" {
  bucket = var.bucketID

  index_document {
    suffix = var.fileSuffix
  }
}

/*
Configure the S3 bucket settings (via referecing) to disable all ACL block public access
*/
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = var.bucketID

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

/*
Configure the S3 bucket Object Ownership rule to `BucketOwnerPreferred`
*/
resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = var.bucketID

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

/*
Configure the S3 bucket acl to `public-read` you will also need to make sure this block
runs after `aws_s3_bucket_ownership_controls` and `aws_s3_bucket_public_access_block`

Hint: the `depends_on` argument will help here
*/
resource "aws_s3_bucket_acl" "public_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_ownership,
    aws_s3_bucket_public_access_block.public_access,
  ]
  bucket = var.bucketID
  acl    = "public-read"
}

/*
Create an output where it prints the `website_endpoint` attribute from the `aws_s3_bucket_website_configuration` block
*/
