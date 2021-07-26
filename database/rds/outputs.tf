output "region" {
    description = "compute"
    value = module.database.region
}

output "rds_name" {
    description = "compute"
    value = module.database.rds_name
}

output "instance_type_1" {
    description = "compute"
    value = module.database.instance_type_1
}

output "port" {
    description = "compute"
    value = module.database.port
}

output "storage" {
    description = "compute"
    value = module.database.capacity
}