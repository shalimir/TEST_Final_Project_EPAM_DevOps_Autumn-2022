#####################################################################################
#                               OUTPUT INCTANCES
#####################################################################################
output                        "latest_jenkins_ubuntu" {                  
    value                   = data.aws_ami.latest_jenkins_ubuntu.id
    }


output                        "latest_webapp_ubuntu" {                  
    value                   = data.aws_ami.webapp_ubuntu.id
}

#####################################################################################
#                              OUTPUT WEBSERVERS IP
#####################################################################################
output                        "jenkins_main_webserver_public_ip" {                  
    value                   = aws_instance.jenkins_main.public_ip
    }

output                        "webapp_ubuntu_server_public_ip" {                  
    value                   = aws_instance.webapp_ubuntu_server.public_ip
    }
