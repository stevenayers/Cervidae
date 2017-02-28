##################################################################################################################
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_S3_BUCKET Resource provisions and configures an S3 bucket.                   #
#                                                                                                                #
# Amazon S3 has a simple web services interface that you can use to store and retrieve any amount of data,       #
# at any time, from anywhere on the web.                                                                         #
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