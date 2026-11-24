resource "aws_s3_bucket" "this" {
  bucket = "${var.env}-bucket-local"

  tags = {
    test = "lock"
  }
}

resource "aws_sqs_queue" "this" {
  name = "${var.env}-queue-local"
}

resource "aws_dynamodb_table" "this" {
  name         = "${var.env}-table-local"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
