#terraform {
#  backend "s3" {
#    bucket         = "naveen-terraform-state-bucket"
#    key            = "global/s3/terraform.tfstate"
#    region         = "ap-south-1"
#    encrypt        = true
#    use_lockfile   = true  # New parameter for state locking
#  }
#}

