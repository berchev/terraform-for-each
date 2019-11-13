variable "region" {
  description = "AWS default region"
  default     = "us-east-2"
}

variable "ami" {
  description = "AWS ami according to the region"
  default     = "ami-0e2a1b35025f3e97d"
}

variable "instance_type" {
  description = "AWS instance characteristics"
  default     = "t2.micro"
}

variable "aws_security_group_name" {
  description = "Dedicated security group"
  default     = "windiws-test"
}

variable "ingress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [3389, 5985, 5986]
}