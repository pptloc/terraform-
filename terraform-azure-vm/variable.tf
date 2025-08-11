variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region (eg: East US)"
}

variable "prefix" {
  type        = string
  description = "Resource name prefix"
  default     = "myapp"
}

variable "vm_name" {
  type        = string
  description = "VM name"
}

variable "admin_username" {
  type        = string
  description = "Admin username"
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to SSH public key (on runner or local). Example: ~/.ssh/id_rsa.pub"
}

variable "vm_size" {
  type        = string
  description = "VM size (dev vs prod)"
  default     = "Standard_B1s"
}

variable "docker_image" {
  type        = string
  description = "Docker image to run (registry/name:tag)"
}

variable "environment" {
  type        = string
  description = "Environment name: dev or prod"
}