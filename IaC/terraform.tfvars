subscription_id = "6c3198c7-7f8a-4a4a-a5c6-451c25adc29e"
tenant_id       = "929a71ed-0fca-4a3f-98c1-e126e08e321f"
rg_name         = "rg-peerislans"
location        = "eastus"
vnet_name       = "vnet-peerislans"
address_space   = ["10.0.0.0/16"]

# Subnet configurations
subnets = {
  aks = {
    name             = "snet-aks"
    address_prefixes = ["10.0.1.0/24"]
    service          = "AKS"
  }
  appgw = {
    name             = "snet-appgw"
    address_prefixes = ["10.0.2.0/24"]
    service          = "Application Gateway"
  }
}
acr_name        = "acrpeerislans"
kv_name         = "kv-peerislans"
aks_name        = "aks-peerislans"
aks_dns_prefix  = "aksprod"
default_node_pool = {
	name            = "agentpool"
	node_count      = 1
	vm_size         = "Standard_DS2_v2"
	os_disk_size_gb = 128
	max_pods        = 110
}
# kubeconfig_path  = "~/.kube/config"