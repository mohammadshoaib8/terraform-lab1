resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id   # You must pass vpc_id to EC2 module

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Allow SSH from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]   # Allow all outbound traffic
  }
}
resource "aws_instance" "testec2" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name = "testec2"
    }
}