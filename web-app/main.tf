terraform {
  backend "s3" {
    bucket         = "km-devops-tf-state"
    key            = "03-basics/import-bootstrap/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

variable "db_pass_1" {
  description = "password for database #1"
  type        = string
  sensitive   = true
}

variable "db_pass_2" {
  description = "password for database #2"
  type        = string
  sensitive   = true
}
module "web_app_1" {
  source = "../web-app-module"

  # Input Variables
  instance_name              = "webserver"
  ami                        = "ami-078c1149d8ad719a7"
  instance_type              = "t2.micro"
  project_name               = "daisy"
  bucket_prefix              = "km-devops-web-app-data"
  security_group_suffix_name = "security-group"
  instance_listening_port    = 8080
  db_username                = "km"
  db_password                = var.db_pass_1
}


module "web_app_2" {
  source = "../web-app-module"

  # Input Variables
  instance_name              = "webserver"
  ami                        = "ami-078c1149d8ad719a7"
  instance_type              = "t2.micro"
  project_name               = "omega"
  bucket_prefix              = "omega-web-app-data"
  security_group_suffix_name = "security-group"
  instance_listening_port    = 8080
  db_username                = "km"
  db_password                = var.db_pass_1
}
