resource "aws_instance" "myec1" {
  ami           = "ami-0b72821e2f351e396"
  instance_type = "t2.micro"
  #   tags          = local.tags

  #   lifecycle {
  #     create_before_destroy = true
  #     ignore_changes = [
  #       tags["Environment"]
  #     ]
  #   }
  security_groups = [aws_security_group.mysg.name]
}

resource "aws_security_group" "mysg" {
  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = ingress
    content {
      description = "Allowing Traffic from ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["10.0.0.0/16"]
      protocol    = "TCP"
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports
    iterator = egress
    content {
      description = "Allowing Traffic to ${egress.key}"
      from_port   = egress.value
      to_port     = egress.value
      cidr_blocks = ["10.0.0.0/16"]
      protocol    = "TCP"
    }
  }
}