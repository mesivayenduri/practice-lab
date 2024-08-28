variable "ingress_ports" {
  type    = list(any)
  default = ["8080", "443", "22"]
}

variable "egress_ports" {
  type = map(any)
  default = {
    "splunk" : "8993"
    "elasticsearch" : "7600"
  }
}

locals {
  tags = {
    "Name"  = "FirstInstanceByTerraform"
    "Date"  = formatdate("DD MM YYYY hh:mm:ss ZZZ", timestamp())
    "Owner" = "Sai Siva"
    "Role"  = "Billing"
  }
}