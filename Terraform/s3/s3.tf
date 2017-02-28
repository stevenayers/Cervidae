##################################################################################################################
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_S3_BUCKET Resource provisions and configures an S3 bucket.                   #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/s3_bucket.html                                  #
#                                                                                                                #
##################################################################################################################

resource "aws_s3_bucket" "default" {
  bucket = "${var.bucket_name}"

  tags {
    Name = "${var.bucket_name}"
  }
}