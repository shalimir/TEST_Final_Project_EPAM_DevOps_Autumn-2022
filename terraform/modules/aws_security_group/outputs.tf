#####################################################################################
#                             OUTPUT SECURITY GROUP
#####################################################################################

#output                        "network_details" {                  
 #   value                   = data.terraform_remote_state.network
#}

output                        "webserver_sq_id" {   #to use our DB remotely we need use to `output` for other people
    value                   = aws_security_group.webapp_server.id
}
