
//#region vpc / subnet / firewall configuration

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_security_group" "instances" {
  name = "${var.project_name}-${var.security_group_suffix_name}"
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id

  from_port   = var.instance_listening_port
  to_port     = var.instance_listening_port
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

//#endregion
