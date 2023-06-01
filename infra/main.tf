terraform {
  cloud {
    organization = "ashiqrahmantesting"

    workspaces {
      name = "github_actions"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "cmcloudlab520.info"

  tags = {
    Name        = "My Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "test_object" {
  bucket = aws_s3_bucket.mybucket.bucket
  key    = file("${path.module}./123")
}
