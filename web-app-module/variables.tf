
variable "instance_name" {
  description = "Name of ec2 instance"
  type        = string
}

variable "bucket_prefix" {
  description = "Bucket prefix for s3 bucket"
  type        = string
}

variable "instance_listening_port" {
  description = "Port number that your webserver is running at."
  type        = number
  default     = 8080
}

variable "application_load_balancer_suffix" {
  description = "Name of the application load balancer"
  type        = string
  default     = "load-balancer"
}

variable "security_group_suffix_name" {
  description = "Suffix name of the security group"
  type        = string
}

variable "db_username" {
  description = "Username for database"
  type        = string
}

variable "db_password" {
  description = "Password for database"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Name of the project that you are provisioning these infra for"
  type        = string
}

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-078c1149d8ad719a7"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}
