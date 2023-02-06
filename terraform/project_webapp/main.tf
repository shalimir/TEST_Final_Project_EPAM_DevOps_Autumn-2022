provider "aws" {
  region = var.region
}


#####################################################################################
#                                         S3 Save and taken
#####################################################################################

terraform {
  backend                     "s3" {
    bucket                  = "l1final--lvladymirshaly--terraform--state"
    key                     = "dev/network/terraform.tfstate"  #name of darictory= path
    region                  = "eu-west-1"
  }
}

#data                          "terraform_remote_state" "network"{   #Take BD througt `data` s3 bucket 
#    backend                 = "s3"
#    config                  = {
#    bucket                  = "l1final--lvladymirshaly--terraform--state"
#    key                     = "dev/network/terraform.tfstate"  #name of darictory= path
#    region                  = "eu-west-1"  
#    }
# }


#####################################################################################
#                                         Modules
#####################################################################################


module "aws_servers_default" {
  source = "../modules/aws_servers"
#  subnet_id               = element(aws_subnet.public_subnets[*].id, count.index) 
}

module "vpc-default" {
  source = "../modules/aws_network"
}

#module "aws_sq_default" {
#  source = "../modules/aws_security_group"
#}


/*module "vpc-dev" {
  source = "../modules/aws_network"
    //  source               = "https://github.com/shalimir/L1_Final_Project_EPAM_DevOps_Autumn-2022/tree/main/terraform"

  env                  = "dev"
  vpc_cidr             = "10.100.0.0/16"
  public_subnet_cidrs  = ["10.100.1.0/24", "10.100.2.0/24"]
  private_subnet_cidrs = []
}

module "vpc-prod" {
  source = "../modules/aws_network"
  //  source               = "https://github.com/shalimir/L1_Final_Project_EPAM_DevOps_Autumn-2022/tree/main/terraform"
  env                  = "prod"
  vpc_cidr             = "10.10.0.0/16"
  public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  private_subnet_cidrs = ["10.10.11.0/24", "10.10.22.0/24", "10.10.33.0/24"]
}*/


#---------------------------------------------------------------------------------------------
