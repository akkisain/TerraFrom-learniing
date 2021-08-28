#Ec2 Instance blocked
resource "aws_instance" "webserver" {
  instance_type = "t2.micro"
  ami           = "ami-0c2b8ca1dad447f8a"
  tags = {
    Name = "Apache_Webserver"
  }

  security_groups = ["${aws_security_group.ec2_webserver_security_group.name}"]
  user_data       = <<-EOF
      #!/bin/sh
      sudo yum  update -y
      sudo yum install httpd -y 
      sudo systemctl status httpd
      sudo systemctl start httpd
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "hello amit" > /var/www/html/index.html
      EOF
}

# Security Group Blocked
resource "aws_security_group" "ec2_webserver_security_group" {
  name        = "EC2-webserver-SG"
  description = "Webserver for EC2 Instances"

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

