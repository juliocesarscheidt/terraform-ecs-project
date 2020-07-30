terraform {
  required_version = "~> 0.12.0"

  backend "s3" {
    bucket = "blackdevs-aws"
    key    = "terraform/ecs-project/state.tfstate"
    region = "sa-east-1"
  }
}