terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "practice" {
  name     = "rg-xpf-practice"
  location = "Southeast Asia"
}

resource "azurerm_storage_account" "practice" {
  name                     = "stxpfpractice001"   # must be globally unique, lowercase, no dashes
  resource_group_name      = azurerm_resource_group.practice.name
  location                 = azurerm_resource_group.practice.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}