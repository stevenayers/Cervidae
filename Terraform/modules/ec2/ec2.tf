##################################################################################################################
#                                                                                                                #
# This module allows us to keep every EC2 instance's provisioning the same despite it's role in the project,     #
# by having the elasticsearch, logstash & kibana modules simply calling this module and passing their own        #
# values in to meet their own needs.                                                                             #
#                                                                                                                #
# Every EC2 instance will have an Elastic IP (more info below) and run Puppet in masterless mode, configured     #
# via the 'null_resource.bootstrap' Resource, which runs the bootstrap.sh script in the current directory.       #
#                                                                                                                #
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_INSTANCE Resource provisions and configures an EC2 Instance.                 #
#                                                                                                                #
# Amazon Elastic Compute Cloud (Amazon EC2) provides scalable computing capacity in the Amazon Web Services      #
# (AWS) cloud. Using Amazon EC2 eliminates your need to invest in hardware up front, so you can develop and      #
# deploy applications faster. You can use Amazon EC2 to launch as many or as few virtual servers as you need,    #
# configure security and networking, and manage storage. Amazon EC2 enables you to scale up or down to handle    #
# changes in requirements or spikes in popularity, reducing your need to forecast traffic.                       #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/instance.html                                   #
#                                                                                                                #
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_EIP Resource provisions and configures an Elastic IP and ties it to          #
# an instance.                                                                                                   #
#                                                                                                                #
# An Elastic IP address is a static IPv4 address designed for dynamic cloud computing. An Elastic IP address     #
# is associated with your AWS account. With an Elastic IP address, you can mask the failure of an instance or    #
# software by rapidly remapping the address to another instance in your account.                                 #
#                                                                                                                #
# An Elastic IP address is a public IPv4 address, which is reachable from the Internet. If your instance does    #
# not have a public IPv4 address, you can associate an Elastic IP address with your instance to enable           #
# communication with the Internet; for example, to connect to your instance from your local computer.            #                                                                                  #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/eip.html                                        #
#                                                                                                                #
#                                                                                                                #
# The NULL_RESOURCE is a resource that allows you to configure provisioners that are not directly associated     #
# with a single existing resource.                                                                               #
#                                                                                                                #
# A null_resource behaves exactly like any other resource, so you configure provisioners, connection details,    #
# and other meta-parameters in the same way you would on any other resource.                                     #
#                                                                                                                #
# This allows fine-grained control over when provisioners run in the dependency graph..                          #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/provisioners/null_resource.html                                 #
#                                                                                                                #
#                                                                                                                #
# The FILE provisioner is used to copy files or directories from the machine executing Terraform to the newly    #
# created resource. The file provisioner supports both ssh and winrm type connections.                           #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/provisioners/file.html                                          #
#                                                                                                                #
#                                                                                                                #
# The REMOTE-EXEC provisioner invokes a script on a remote resource after it is created. This can be used to     #
# run a configuration management tool, bootstrap into a cluster, etc. To invoke a local process, see the         #
# local-exec provisioner instead. The remote-exec provisioner supports both ssh and winrm type connections.      #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/provisioners/remote-exec.html                                   #
#                                                                                                                #
#                                                                                                                #
# Many provisioners require access to the remote resource. For example, a provisioner may need to use SSH or     #
# WinRM to connect to the resource.                                                                              #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/provisioners/connection.html                                    #
#                                                                                                                #
##################################################################################################################


resource "aws_instance" "ec2" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_id}"
  vpc_security_group_ids      = ["${var.sg_id}", "${var.default_sg_id}"]
  associate_public_ip_address = false
  key_name                    = "${var.key_pair}"

  tags {
    Name = "${var.server_type}"
  }
}

resource "aws_eip" "ec2" {
  instance = "${aws_instance.ec2.id}"
  vpc      = true
}

resource "null_resource" "bootstrap" {
  triggers {
    ec2_id = "${aws_eip.ec2.id}, ${aws_instance.ec2.id}"
  }

  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
    connection {
      type        = "ssh"
      user        = "${var.remote_user}"
      private_key = "${file("${path.root}/private_keys/${var.private_key_path}")}"
      host        = "${aws_eip.ec2.public_ip}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh ${var.server_type}"
    ]
    connection {
      type        = "ssh"
      user        = "${var.remote_user}"
      private_key = "${file("${path.root}/private_keys/${var.private_key_path}")}"
      host        = "${aws_eip.ec2.public_ip}"
    }
  }
}