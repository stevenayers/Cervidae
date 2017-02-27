resource "aws_s3_bucket" "default" {
  bucket = "${var.bucket_name}"

  tags {
    Name = "${var.bucket_name}"
  }
}