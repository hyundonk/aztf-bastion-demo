resource_group_name="deleteme-demo"
location="koreacentral"

networking_object                 = {
  vnet = {
      name                = "-vnet"
      address_space       = ["10.10.0.0/16"]
      dns                 = []
  }
  specialsubnets = {
    AzureBastionSubnet   = {
      name                = "AzureBastionSubnet"
      cidr                = "10.10.2.0/24"
      service_endpoints   = []
    }
 
  }

  subnets = {

    subnet-frontend   = {
      name                = "subnet-frontend"
      cidr                = "10.10.0.0/24"
      service_endpoints   = []
      nsg_name            = "nsg-frontend"
    }
  }
}

custom_data = "cloud_init.txt"

pip = {
  0               = {
    name          = "pip-webserver"
  }
}

webserver = {
  name          = "webserver"

  vm_num        = 1
  vm_size       = "Standard_D2s_v3"
    
  subnet        = "subnet-frontend"
  subnet_ip_offset  = 4
  
  vm_publisher      = "Canonical"
  vm_offer          = "0001-com-ubuntu-server-focal"
  vm_sku            = "20_04-LTS"
  vm_version        = "latest" 
}


admin_username="azureuser"
admin_password="enterpasswordhere"
