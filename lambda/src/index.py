import json 
import boto3
from pprint import pprint
import os

s3_client = boto3.client("s3")
s3_enrypted_bucket = os.environ["S3_ENCRYPTED_BUCKET"]
s3_unencrypted_bucket = os.environ["S3_UNENCRYPTED_BUCKET"]
s3_prefix = ""
s3_file_key = "test.txt"

def lambda_handler(event, context):

    try:
        file_content = s3_client.get_object(Bucket=s3_unencrypted_bucket, Key=s3_file_key)["Body"].read().decode("utf-8")
        print("content of file: " + file_content)
        print("file content")
    except Exception as e:
        print("Error: {}".format(e)))

    try:
        file_content = s3_client.get_object(Bucket=s3_enrypted_bucket, Key=s3_file_key)["Body"].read().decode("utf-8")
        print("content of file: " + file_content)
        print("file content")
    except Exception as e:
        print("Error: {}".format(e)))
