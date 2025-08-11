output "vm_public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "admin_username" {
  value = var.admin_username
}