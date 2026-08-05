
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}



provider "azurerm" {
  features {}
 
}

#Create a resource group
resource "azurerm_resource_group" "t-rg" {
  name     = "t-production"
  location = "East US"
  tags = {
    Environment        = "Lab"
    Owner              = "Trivaun"
    DataClassification = "Internal"
    Project            = "Azure Security Baseline"

  }
}

# Create a virtual network within the resource group
 resource "azurerm_virtual_network" "t-vnet" {
   name                = "t-network"
   resource_group_name = azurerm_resource_group.t-rg.name
   location            = azurerm_resource_group.t-rg.location
   address_space       = ["10.124.0.0/16"]

   tags = {
      Environment = "Lab"
      Owner              = "Trivaun"
      DataClassification = "Internal"
      Project            = "Azure Security Baseline"
   }
 }

