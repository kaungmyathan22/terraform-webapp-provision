//#region instance configuration
resource "aws_instance" "instance_1" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > index.html
              python3 -m http.server 8080 &
              EOF
  tags = {
    Name    = "${var.project_name}-${var.instance_name}-backend-1"
    project = var.project_name
  }
}

resource "aws_instance" "instance_2" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 2" > index.html
              python3 -m http.server 8080 &
              EOF
  tags = {
    Name    = "${var.project_name}-${var.instance_name}-backend-2"
    project = var.project_name
  }
}
//#endregion
