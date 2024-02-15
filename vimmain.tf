provider "aws" {
region = "ap-south-1"
access_key = "AKIA3ZNCZBVZDEHPVY4K"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-ami-0449c34f967dbf18a"
instance_type = "t2.micro"
   key_name = "ManagementKeyPair.pem"
   vpc_security_group_ids = [aws_security_group.bar.id]
   availability_zone = "ap-south-1"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd 
sudo chkconfig httpd on
sudo echo "Hai All This is My Zomato-1 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Zomato-1"
}
}

resource "aws_instance" "two" {
ami = "ami-0e731c8a588258d0d"
instance_type = "t2.micro"
   key_name = "ManagementKeyPair .pem"
   vpc_security_group_ids = [aws_security_group.bar.id]
   availability_zone = "ap-south-1"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo chkconfig httpd on
sudo echo "Hai All This is My Zomato-2 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Zomato-1"
}
}

