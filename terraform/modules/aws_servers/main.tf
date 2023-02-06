# S3 backend
# Take BD througt `data` s3 bucket
# Instance1 - Jenkins
# Instance2 - WebApp


#####################################################################################
#                                    DATA
#####################################################################################


#data                          "terraform_remote_state" "network"{   #Take BD througt `data` s3 bucket 
#    backend                 = "s3"
#    config                  = {
#    bucket                  = "l1final--lvladymirshaly--terraform--state"
#    key                     = "dev/network/terraform.tfstate"  #name of darictory= path
#    region                  = "eu-west-1"  
#    }
#    }


data                          "aws_ami" "latest_jenkins_ubuntu" {
  owners                    = ["099720109477"]  #go to the Imeges/AMI/Public Images/Search with ami incstances you need
  most_recent               = true
  filter {
    name                    = "name"
    values                  = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]              # is AMI name '-*' - meanse the leatest version (most recent)
  }
}


data                          "aws_ami" "webapp_ubuntu" {
  owners                    = ["099720109477"]  #go to the Imeges/AMI/Public_Images/Search with ami incstances you need
  most_recent               = true
  filter {
    name                    = "name"
    values                  = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]              # is AMI name '-*' - meanse the leatest version (most recent)
  }
}

#####################################################################################
#                             CREATE TWO INSTANCES
#####################################################################################

resource                      "aws_instance" "jenkins_main"{
    ami                      =  data.aws_ami.latest_jenkins_ubuntu.id
    instance_type            =  "t2.micro"
#    vpc_id                  = aws_vpc.main.id      #vpc_security_group_ids   = module.aws_sq_default.webserver_sq_id    #[aws_security_group.webapp_server.id]
#vpc_security_group_ids   = module.aws_sq_default.webserver_sq_id    #[aws_security_group.webapp_server.id]
#    subnet_id                = element(aws_subnet.public_subnets[*].id, count.index) #data.terraform_remote_state.network.outputs.public_subnet_ids[0]
#   tags                     = var.common_tags
    tags                     = merge(var.common_tags, { Name = "${var.common_tags["Enviroment"]} Instance_for_Jenkins"})
}



resource                      "aws_instance" "webapp_ubuntu_server"{
    ami                     =  data.aws_ami.webapp_ubuntu.id
    instance_type           =  "t2.micro"
#    vpc_id                  = aws_vpc.main.id      #vpc_security_group_ids   = module.aws_sq_default.webserver_sq_id    #[aws_security_group.webapp_server.id]
#    subnet_id               = element(aws_subnet.public_subnets[*].id, count.index) #data.terraform_remote_state.network.outputs.public_subnet_ids[0]
#   tags                    = var.common_tags
    tags                    = merge(var.common_tags, {Name = "${var.common_tags["Enviroment"]} Instance_for_Webapp"})

}

#--------------------------------------------------------------------------------------------------

