provider "aws" {
    region = "us-east-2"
    #other provider settings
}
terraform {
    backend "s3" {}
}
module "app" {
    source = "../../../app"
    instance_type = var.instance_type
} 