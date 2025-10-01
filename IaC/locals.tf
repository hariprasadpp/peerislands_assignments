locals {
  common_tags = {
    Project     = "PeerIslands"
    Owner       = "DevOps"
    ManagedBy   = "Terraform"
    CreatedDate = formatdate("YYYY-MM-DD", timestamp())
  }
}