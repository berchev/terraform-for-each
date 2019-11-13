provider "aws" {
  region = var.region
}

resource "aws_instance" "windows" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.windows_sg.id]
}

# Example of for_each function use
resource "aws_security_group" "windows_sg" {
  name        = var.aws_security_group_name
  description = "Security group settings"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}