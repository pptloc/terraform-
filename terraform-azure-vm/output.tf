output "vm_public_ip" {
  description = "Public IP of the VM"
  value       = module.vm.vm_public_ip
}

output "ssh_user" {
  value = module.vm.admin_username
}