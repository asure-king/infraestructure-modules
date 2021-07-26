provider "aws" {
    region = var.region
    version = "~> 3.0"
    #other provider settings
}
terraform {
    backend "s3" {}

    required_version = "1.0.3"
}
module "database" {
    source = "../../../database/rds"
    allocated_storage    = var.storage
    engine               = "mariadb"
    engine_version       = "10.4.13"
    instance_class       = var.instance_type_1
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
    port = var.port
    publicly_accessible = false
}