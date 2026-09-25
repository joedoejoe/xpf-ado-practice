terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatexpf001"
    container_name       = "tfstate"
    key                  = "practice.tfstate"
    use_azuread_auth     = true
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "practice" {
  name     = "rg-xpf-practice"
  location = "Southeast Asia"
}

resource "azurerm_storage_account" "practice" {
  name                     = "stxpfpractice001" # must be globally unique, lowercase, no dashes
  resource_group_name      = azurerm_resource_group.practice.name
  location                 = azurerm_resource_group.practice.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
