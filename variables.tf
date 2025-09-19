
variable "ingress_ports" {
    type = list(number)
    default = [22, 80, 443]
  
}
/*
variable "instances" {
    type = map(string)
    default = {
      "development" = "t3.micro"
      "production" = "m7i-flex.large"
      "testing" = "c7i-flex.large"
    }
  
}
*/