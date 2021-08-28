/*
resource "aws_instance" "web" {
  ami           = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
  count         = 0
  tags = {
    Name = "Terraform-jenkins-Intergration-server"
  }
}
resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  vpc      = true
}
output "eip" {
  value = aws_eip.lb
}
*/
