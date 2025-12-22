terraform {
  cloud {
    organization = "jozef_bodorik_org"

    workspaces {
      name = "azure-aks"
    }
  }
}
