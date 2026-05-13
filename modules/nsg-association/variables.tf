variable "subnet_id" {
  description = "ID of the subnet to associate with the NSG"
  type        = string
}

variable "network_security_group_id" {
  description = "ID of the Network Security Group"
  type        = string
}