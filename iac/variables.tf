# global variables
variable "target" {
  description = "The target node to deploy the VMs"
  type        = string
  default     = "pve"
}

variable "agent_image" {
  description = "The agent image to use"
  type        = number
  default     = 1
}

variable "skip_ipv6" {
  description = "Whether to skip IPv6"
  type        = bool
  default     = true
}

variable "os_type" {
  description = "The OS type to use"
  type        = string
  default     = "l26"
}

variable "scsihw" {
  description = "The SCSI hardware to use"
  type        = string
  default     = "virtio-scsi-single"
}

variable "iso_storage" {
  description = "The ISO storage to use"
  type        = string
  default     = "iso-storage:iso/nocloud-amd64.iso"
}

# control plane variables
variable "vmid_control_plane" {
  description = "The base VM ID"
  type        = number
  default     = 510
}

variable "cpu_cores_control_plane" {
  description = "The number of CPU cores to use"
  type        = number
  default     = 4
}

variable "cpu_sockets_control_plane" {
  description = "The number of CPU sockets to use"
  type        = number
  default     = 1
}

variable "memory_control_plane" {
  description = "The amount of memory to use"
  type        = number
  default     = 4096
}

variable "disk_size_control_plane" {
  description = "The size of the disk to use"
  type        = string
  default     = "64G"
}

variable "disk_storage_control_plane" {
  description = "The storage to use"
  type        = string
  default     = "zfs-vm"
}

# workers variables
variable "vmid_worker" {
  description = "The base VM ID"
  type        = number
  default     = 520
}

variable "cpu_cores_worker" {
  description = "The number of CPU cores to use"
  type        = number
  default     = 2
}

variable "cpu_sockets_worker" {
  description = "The number of CPU sockets to use"
  type        = number
  default     = 1
}

variable "memory_worker" {
  description = "The amount of memory to use"
  type        = number
  default     = 2048
}

variable "disk_size_worker" {
  description = "The size of the disk to use"
  type        = string
  default     = "32G"
}

variable "disk_storage_worker" {
  description = "The storage to use"
  type        = string
  default     = "zfs-vm"
}