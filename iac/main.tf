# resource "proxmox_vm_qemu" "talos" {
#   for_each = local.talos_nodes

#   name        = each.key
#   target_node = each.value.target_node
#   agent       = 1
#   skip_ipv6   = true
#   vmid        = local.vmid + index(keys(local.talos_nodes), each.key)
#   # onboot = true
#   # boot = "order=virtio0;ide2;net0"
#   os_type = "l26"
#   # bios = "ovmf"
#   # vm_state = "running"

#   cpu {
#     type    = "host"
#     cores   = 2
#     sockets = 1
#   }
#   memory = 2048
#   scsihw = "virtio-scsi-single"

#   disk {
#     type = "cdrom"
#     iso  = "iso-storage:iso/nocloud-amd64.iso"
#     slot = "ide2"
#   }

#   disk {
#     type    = "disk"
#     slot    = "scsi0"
#     size    = "32G"
#     storage = "zfs-vm"
#     # format = "qcow2"
#   }

#   # efidisk {
#   #   efitype = "4m"
#   #   storage = "local"
#   # }

#   # bootdisk = "scsi0"

#   network {
#     id     = 0
#     model  = "virtio"
#     bridge = "vmbr0"
#   }

#   # vga {
#   #   type = "serial0"
#   # }
#   # serial {
#   #   id   = 0
#   #   type = "socket"
#   # }
# }
