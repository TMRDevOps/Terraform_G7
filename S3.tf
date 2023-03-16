resource "aws_kms_key" "g7key" {
  description             = "This is the key for our repo"
  deletion_window_in_days = 30
}

resource "aws_s3_bucket" "g7bucket" {
  bucket = "bootcamp-30-7-tmr"

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         kms_master_key_id = aws_kms_key.g7key.arn
#         sse_algorithm     = "aws:kms"
#       }
#     }
#   }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "g7_s3" {
  bucket = aws_s3_bucket.g7bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.g7key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}