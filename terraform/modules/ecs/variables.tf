variable "project" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "ecr_repo_url" {
  type = string
}

variable "ecs_tasks_sg_id" {
  type = string
}

variable "execution_role_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}

variable "task_cpu" {
  type    = string
  default = "256"
}

variable "task_memory" {
  type    = string
  default = "512"
}

variable "app_port" {
  type    = number
  default = 3000
}

variable "desired_count" {
  type    = number
  default = 1
}
