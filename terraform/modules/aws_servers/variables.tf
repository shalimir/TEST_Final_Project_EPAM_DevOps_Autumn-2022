#variable "region" {
#   description          = "Please Enter AWS Region to Deploy Server"
#   type                 = string
#   default              = "eu-west-1"
#}


variable "webapp_server"{
   description          =  "List of Portds to open for server"
   type                 = list  
   default              = ["80", "8080", "22","443"]
}

variable "common_tags" {
   description          = "Common Tags to apply to all resourses"
   type                 = map 
   default              = {
    Owner               = "Vladymir_Shaly"
    Project             = "L1_FINAL"
    Enviroment          = "development"
   }


} 