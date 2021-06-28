variable "location" {
  description = "Location of the hub'n spoke"
  default = "eastus"
}

variable "username" {
  description = "Username for virtual machines"
  default = "testadmin"
}

variable "password" {
  description = "Password for virtual machines"
  default = "PasswordAtf1234!"
}

variable "vmsize" {
  description = "Size of the VMs"
  default = "Standard_A1_v2"
}