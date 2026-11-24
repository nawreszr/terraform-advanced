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
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
