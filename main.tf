# Configure the Azure provider

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

required_version = ">= 0.14.9"
backend "remote" {
  hostname     = "app.terraform.io"
  organization = "Syfanx_Playground"
  workspaces {
    name = "TF-GHA-Azure_State"
    }
  } 
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "southeastasia"

  tags = {
    Environment = "Terraform Getting Started"
    Team	= "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "myTFVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "southeastasia"
    resource_group_name = azurerm_resource_group.rg.name
}



