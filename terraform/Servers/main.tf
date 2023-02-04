provider                      "aws" {
  region                    = "eu-west-1"
}

terraform {                            #All our DB save ` dev/servers/terraform.tfstate`            
  backend             "s3" {
    bucket          = "l1final--lvladymirshaly--terraform--state"
    key             = "dev/servers/terraform.tfstate"  #name of darictory= path
    region          = "eu-west-1"
  }
  
}


#-------------------------------------------------------------------------------------



data                          "terraform_remote_state" "network"{   #Take BD througt `data` s3 bucket 
    backend                 = "s3"
    config                  = {
    bucket                  = "l1final--lvladymirshaly--terraform--state"
    key                     = "dev/network/terraform.tfstate"  #name of darictory= path
    region                  = "eu-west-1"  
    }
    }


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
#----------------------------------------------------------------------------------------


resource                      "aws_instance" "jenkins_main"{
    ami                     =  data.aws_ami.latest_jenkins_ubuntu.id
    instance_type           =  "t2.micro"
    vpc_security_group_ids  =  [aws_security_group.webapp_server.id]
    subnet_id               = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
#   tags                     = var.common_tags
    tags                     = merge(var.common_tags, { Name = "${var.common_tags["Enviroment"]} Instance_for_Jenkins"})
}



resource                      "aws_instance" "webapp_ubuntu_server"{
    ami                     =  data.aws_ami.webapp_ubuntu.id
    instance_type           =  "t2.micro"
    vpc_security_group_ids  =  [aws_security_group.webapp_server.id]
    subnet_id               = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
#   tags                    = var.common_tags
    tags                    = merge(var.common_tags, {Name = "${var.common_tags["Enviroment"]} Instance_for_Webapp"})

}




#--------------------------------------------------------------------------------------


resource                      "aws_security_group" "webapp_server" {
  name                      = "Webapp_Dynamic_Security_Group#1"
  vpc_id                    = data.terraform_remote_state.network.outputs.vpc_id
  
  dynamic "ingress" {
    for_each                = var.webapp_server
    content {
      from_port             = ingress.value
      to_port               = ingress.value
      protocol              = "tcp"
      cidr_blocks           = ["0.0.0.0/0"]
    }
  }
  ingress {
      from_port             = 22
      to_port               = 22
      protocol              = "tcp"
      cidr_blocks           = [data.terraform_remote_state.network.outputs.vpc_cidr]
  }
 
  egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
    ipv6_cidr_blocks       = ["::/0"]
  }


  tags                      = {
    Name                    = "web_server_sq"
    Owner                   = "Vladymir_Shaly"
    Project                 = "L1_FINAL"
  }
}
#--------------------------------------------------------------------------


output                        "network_details" {                  
    value                   = data.terraform_remote_state.network
}

output                        "webserver_sq_id" {   #to use our DB remotely we need use to `output` for other people
    value                   = aws_security_group.webapp_server.id
}


#-----------------------------OUTPUT INCTANCES-----------------------------------------------

output                        "latest_jenkins_ubuntu" {                  
    value                   = data.aws_ami.latest_jenkins_ubuntu.id
    }


output                        "latest_webapp_ubuntu" {                  
    value                   = data.aws_ami.webapp_ubuntu.id
}


#-------------------------------OUTPUT WEBSERVERS------------------------------------------------------------

output                        "jenkins_main_webserver_public_ip" {                  
    value                   = aws_instance.jenkins_main.public_ip
    }

output                        "webapp_ubuntu_server_public_ip" {                  
    value                   = aws_instance.webapp_ubuntu_server.public_ip
    }
