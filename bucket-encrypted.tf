# Purpose: Create an S3 bucket with encryption
resource "aws_s3_bucket" "s3_encrypted" {
  bucket = "pk-test-encrypted-bucket"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.s3_encrypted.id 
  acl = "private" 
}
  
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.s3_encrypted.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = module.kms.key_arn
      sse_algorithm     = "aws:kms"
    }

  }
  
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.s3_encrypted.id
  key    = "text.txt"
  source = "${path.module}/Scripts/kms-terraform/lambda"
  }

