terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-west-2"
}

variable "project" {
  default = "webapp-dev"
}

module "vpc" {
  source  = "../../modules/vpc"
  project = var.project
  azs     = ["${var.aws_region}a", "${var.aws_region}b"]
}

module "ecr" {
  source  = "../../modules/ecr"
  project = var.project
}

module "sg" {
  source   = "../../modules/sg"
  project  = var.project
  vpc_id   = module.vpc.vpc_id
}

module "iam" {
  source  = "../../modules/iam"
  project = var.project
}

module "ecs" {
  source             = "../../modules/ecs"
  project            = var.project
  aws_region         = var.aws_region
  public_subnet_ids  = module.vpc.public_subnet_ids
  ecr_repo_url       = module.ecr.repository_url
  ecs_tasks_sg_id    = module.sg.ecs_tasks_sg_id
  execution_role_arn = module.iam.execution_role_arn
  task_role_arn      = module.iam.task_role_arn
  desired_count      = 1
}

output "ecr_repo_url" {
  value = module.ecr.repository_url
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}
