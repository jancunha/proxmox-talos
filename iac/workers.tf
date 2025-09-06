resource "proxmox_vm_qemu" "worker" {
  count = local.worker.count

  name        = "${local.worker.name_prefix}-${count.index}"
  target_node = local.target
  agent       = local.agent_image
  skip_ipv6   = local.skip_ipv6
  vmid        = local.worker.vmid_prefix + count.index
  os_type     = local.os_type

  # cpu config
  cpu {
    type    = local.worker.cpu_type
    cores   = local.worker.cpu_cores
    sockets = local.worker.cpu_sockets
  }

  # memory config
  memory = local.worker.memory
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
    size    = local.worker.disk_size
    storage = local.worker.disk_storage
  }

  # network config
  network {
    id     = local.network.id_prefix
    model  = local.network.model_prefix
    bridge = local.network.bridge_prefix
  }

  # tags
  tags = local.worker.tags
}