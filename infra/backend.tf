#terraform {
#  backend "local" {
#    path = "./terraform.tfstate"
#  }
#}

terraform {
  backend "s3" {
    bucket         = "naveen-1812001-terraform-state-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    use_lockfile   = true
  }
}
