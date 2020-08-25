provider "aws" {
  version = ">= 2.28.1"
}

terraform {
  backend "s3" {
    #These configuration points are set in CI as they cannot be interpolated.
    #bucket = "mybucket"
    #key    = "path/to/my/key"
    #region = "us-east-1"
  } 
}