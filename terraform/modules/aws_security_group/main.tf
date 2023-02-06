
 #####################################################################################
#                                AWS Security Group
#####################################################################################


resource                      "aws_security_group" "webapp_server" {
  name                      = "Webapp_Dynamic_Security_Group#1"
  vpc_id                    = aws_vpc.main.id
  tags                      = var.common_tags
  
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
      cidr_blocks           = "0.0.0.0/0"
  }
 
  egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
    ipv6_cidr_blocks        = ["::/0"]
  }
}
#--------------------------------------------------------------------------