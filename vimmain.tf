provider "aws" {
region = "us-east-1"
access_key = "AKIA6ODU56BRJBFZ6AN3"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-0e731c8a588258d0d"
instance_type = "t2.medium"
   key_name = "terra-key"
   vpc_security_group_ids = [aws_security_group.three.id]
   availability_zone = "us-east-1a"
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
   key_name = "terra-key"
   vpc_security_group_ids = [aws_security_group.three.id]
   availability_zone = "us-east-1b"
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

