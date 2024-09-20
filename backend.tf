terraform {
  backend "s3" {
    bucket = "fnc-eks-tf-state"
    key    = "eks/terraform.tfstate"
    region = "us-west-1"
    # dynamodb_table = "eks-cluster-lock"
    encrypt = true
  }
}
