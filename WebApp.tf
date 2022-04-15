resource "azurerm_app_service_plan" "svcplan" {
  name                = "webapp1"
  location            = "eastus"
  resource_group_name = "1-ae6b8519-playground-sandbox"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = "sagarapp1"
  location            = "eastus"
  resource_group_name = "1-ae6b8519-playground-sandbox"
  app_service_plan_id = azurerm_app_service_plan.svcplan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}