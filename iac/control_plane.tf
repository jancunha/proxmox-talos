resource "proxmox_vm_qemu" "control_plane" {
  count = local.control_plane.count

  name        = "${local.control_plane.name_prefix}-${count.index}"
  target_node = local.target
  agent       = local.agent_image
  skip_ipv6   = local.skip_ipv6
  vmid        = local.control_plane.vmid_prefix + count.index
  os_type     = local.os_type

  # cpu config
  cpu {
    type    = local.control_plane.cpu_type
    cores   = local.control_plane.cpu_cores
    sockets = local.control_plane.cpu_sockets
  }

  # memory config
  memory = local.control_plane.memory
  scsihw = local.scsihw

  # disk config
  disk {
    type = "cdrom"
    iso  = local.iso_storage
    slot = "ide2"
  }

  disk {
    type    = "disk"
    slot    = "scsi0"
    size    = local.control_plane.disk_size
    storage = local.control_plane.disk_storage
  }

  # network config
  network {
    id     = local.network.id_prefix
    model  = local.network.model_prefix
    bridge = local.network.bridge_prefix
  }

  # tags
  tags = local.control_plane.tags
}