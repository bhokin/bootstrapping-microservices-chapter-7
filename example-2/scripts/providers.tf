# Initialises Terraform providers and sets their version numbers.

provider "azurerm" {
    version = "3.41.0"
    features {}
}

provider "tls" {
    version = "2.1.0"
}

provider "kubernetes" {
    version = "1.10.0"
    host = azurerm_kubernetes_cluster.cluster.kube_config[0].host

    client_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate)
}
