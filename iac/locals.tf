locals {
  # global config
  target      = var.target
  agent_image = var.agent_image
  skip_ipv6   = var.skip_ipv6
  os_type     = var.os_type
  scsihw      = var.scsihw
  iso_storage = var.iso_storage

  # control plane config
  control_plane = {

    count       = 1
    name_prefix = "talos-control-plane"
    vmid_prefix = var.vmid_control_plane

    # machine config
    cpu_cores    = var.cpu_cores_control_plane
    cpu_sockets  = var.cpu_sockets_control_plane
    cpu_type     = "host"
    memory       = var.memory_control_plane
    disk_size    = var.disk_size_control_plane
    disk_storage = var.disk_storage_control_plane

    tags = "control-plane,talos"
  }

  # worker config
  worker = {

    count       = 1
    name_prefix = "talos-worker"
    vmid_prefix = var.vmid_worker

    # machine config
    cpu_cores    = var.cpu_cores_worker
    cpu_sockets  = var.cpu_sockets_worker
    cpu_type     = "host"
    memory       = var.memory_worker
    disk_size    = var.disk_size_worker
    disk_storage = var.disk_storage_worker

    tags = "worker,talos"
  }

  # network global config
  network = {
    id_prefix     = 0
    model_prefix  = "virtio"
    bridge_prefix = "vmbr0"
  }
}