resource "aws_s3_bucket" "s3_unencrypted" {
    bucket = "pki-terraform-unencrypted"
  }

resource "aws_s3_bucket_acl" "s3_unencrypted_acl" {
    bucket = "${aws_s3_bucket.s3_unencrypted.id}"
    acl    = "private"
  }

resource "aws_s3_object" "file_unencrypted" {
    bucket = "${aws_s3_bucket.s3_unencrypted.id}"
    key = "text.txt"
    source = "${path.module}/Scripts/kms-terraform/lambda/text.txt"
  }



  
  
