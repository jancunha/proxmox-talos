output "control_plane_vms" {
  value = [
    for vm in proxmox_vm_qemu.control_plane :
    {
      name = vm.name
      ip   = try(vm.default_ipv4_address, null)
    }
  ]
}

output "worker_vms" {
  value = [
    for vm in proxmox_vm_qemu.worker :
    {
      name = vm.name
      ip   = try(vm.default_ipv4_address, null)
    }
  ]
}