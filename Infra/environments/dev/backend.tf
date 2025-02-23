terraform{
  backend "s3" {
    bucket         = "nsh-usecase-sqs"
    key            = "NSH-sqs/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
