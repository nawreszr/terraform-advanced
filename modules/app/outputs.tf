output "bucket_name" { value = aws_s3_bucket.this.bucket }
output "queue_url" { value = aws_sqs_queue.this.url }
output "table_name" { value = aws_dynamodb_table.this.name }
