
/*output "prod_public_subnet_ids" {
  value = module.vpc-prod.public_subnet_ids
}

output "prod_private_subnet_ids" {
  value = module.vpc-prod.private_subnet_ids
}

output "dev_public_subnet_ids" {
  value = module.vpc-dev.public_subnet_ids
}

output "dev_private_subnet_ids" {
  value = module.vpc-dev.private_subnet_ids
}

*/
output "vpcs" {
  value = module.vpc-default.vpc_id
}

output "public_subnet_id_now" {
  value = module.vpc-default.public_subnet_ids
}

#output "security_group" {
#  value = module.aws_sq_default.webserver_sq_id
#}

output "sq_ciddr_block" {
  value = module.vpc-default.vpc_id
}