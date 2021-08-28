/*
provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}


resource "aws_s3_bucket" "b" {
  bucket = "amitsain-alex"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object1" {
for_each = fileset("s3-objects-files/", "*")
bucket = aws_s3_bucket.b.id
key = each.value
source = "s3-objects-files/${each.value}"
etag = filemd5("s3-objects-files/${each.value}")
}


*/
