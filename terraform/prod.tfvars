# Auto fill parameters for DEV

#File can be names as:
# terraform.tfvars  
       #OR
# prod.auto.tfvars
       #OR
# dev.auto.tvars
# terraform apply -var-file="prod.tfvars"


region                        = "eu-west-1"
instance_type                 = "t2.micro"
enable_detailed_monitoring    = fasle


allow_ports                   = ["80", "8080", "22", "443"]

common_tags                   = {
    Owner               = "Vladymir_Shaly"
    Project             = "L1_FINAL"
    Enviroment          = "development"
}