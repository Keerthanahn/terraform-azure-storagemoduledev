resource "azurerm_resource_group" "keer-rg1" {
  name     = var.resourcegroup
  location = "Central India"
}

resource "azurerm_storage_account" "keer-sa" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.keer-rg1.name
  location                 = azurerm_resource_group.keer-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "keer-sc" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.keer-sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "keerblob" {
  name                   = "keerblob"
  storage_account_name   = azurerm_storage_account.keer-sa.name
  storage_container_name = azurerm_storage_container.keer-sc.name
  type                   = "Block"
  source                 = "C:/AzureTerraform/Demo5Modules/modules/storageaccount/Demo.zip"
}