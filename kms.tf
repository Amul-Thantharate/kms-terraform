module "kms" {
  source = "terraform-aws-modules/kms/aws"
  description = "KMS CMK"
  enable_key_rotation = false 
  key_usage = "ENCRYPT_DECRYPT"
  create_external = true

  key_owners = []
  key_administrators = []
  key_users = []
  aliases_use_name_prefix = true
  aliases = ["pk-test/encrypted-bucket"]
  
  grants = {
    lambda_doc_convert = {
      grantee_principal = aws_iam_role.iam_lambda_encrypted.arn
      operations = ["Encrypt", "Decrypt", "GenerateDataKey"]
    }
  }
}
  

