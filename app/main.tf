provider "aws" {
    region = "us-east-2"
    #other provider settings
}
terraform {
    backend "s3" {}
}
module "app" {
    source = "../../../app"
    allocated_storage    = 20
    engine               = "mariadb"
    engine_version       = "10.4.13"
    instance_class       = "db.t3.micro"
    name                 = "mydb"
    username             = "foo"
    password             = "foobarbazx"
    parameter_group_name = "default.mariadb10.4"
    apply_immediately = true
    skip_final_snapshot  = true
    backup_retention_period = "10"
    backup_window = "04:46-05:46"
    db_subnet_group_name = "default"
    delete_automated_backups = false
    iam_database_authentication_enabled = false
    identifier = "thor-production-mx"
    multi_az = "true"
    port = "3306"
    publicly_accessible = false
} 