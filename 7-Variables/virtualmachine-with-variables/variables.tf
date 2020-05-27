variable "system" {
    type = string
    description = "Name of the system or environment"
}

variable "servername" {
    type = string
    description = "Server name of the virtual machine"
}

variable "location" {
    type = string
    description = "Azure location of terraform server environment"
    default = "westus2" //allows to make variables optional. Powerful for customizing tf configs and modules

}

variable "admin_username" {
    type = string
    description = "Administrator username for server"
}

variable "admin_password" {
    type = string
    description = "Administrator password for server"
}

variable "vnet_address_space" { 
    type = list //list of strings, enclosed in []
    description = "Address space for Virtual Network"
    default = ["10.0.0.0/16"]
}

variable "managed_disk_type" { 
    type = map 
//key value pair mapping. We have our string westus2 and another value.
// allows us to perform a particular logic
    description = "Disk type Premium in Primary location Standard in DR location"

    default = {
        westus2 = "Premium_LRS"
        eastus = "Standard_LRS"
    }
}

variable "vm_size" {
    type = string
    description = "Size of VM"
    default = "Standard_B1s"
}

variable "os" {
    description = "OS image to deploy"
    type = object({
        publisher = string
        offer = string
        sku = string
        version = string
  })
}      