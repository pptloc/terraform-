module "vm" {
  source = "./terraform-azure-vm/modules/vm"

  resource_group_name = var.resource_group_name
  location            = var.location
  prefix              = var.prefix
  vm_name             = var.vm_name
  admin_username      = var.admin_username
  ssh_public_key_path = var.ssh_public_key_path
  vm_size             = var.vm_size
  docker_image        = var.docker_image
  environment         = var.environment
}