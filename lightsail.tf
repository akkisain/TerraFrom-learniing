resource "aws_lightsail_domain" "domain_test" {
  domain_name = "mydomain.com"
}

# Create a new GitLab Lightsail Instance
resource "aws_lightsail_instance" "test" {
  name              = "test-lightsail"
  blueprint_id      = "amazon_linux"
  availability_zone = "us-east-1a"
  bundle_id         = "nano_1_0"
}

resource "aws_lightsail_instance_public_ports" "test" {
  instance_name = aws_lightsail_instance.test.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }
}

resource "aws_lightsail_key_pair" "lg_key_pair" {
  name    = "lg_key_pair"
}

resource "aws_lightsail_static_ip" "test" {
  name = "example"
}

resource "aws_lightsail_static_ip_attachment" "test" {
  static_ip_name = aws_lightsail_static_ip.test.id
  instance_name  = aws_lightsail_instance.test.id
}

