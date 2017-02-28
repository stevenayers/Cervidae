##################################################################################################################
#                                                                                                                #
# The Amazon Web Services (AWS) provider is used to interact with the many resources supported by AWS. The       #
# provider needs to be configured with the proper credentials before it can be used.                             #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/index.html                                        #
#                                                                                                                #
##################################################################################################################1

provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
}