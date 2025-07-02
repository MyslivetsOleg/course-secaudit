output "vm_ip_lan_subnet" {
  value = one([for nic in opennebula_virtual_machine.vm.template_nic : nic.computed_ip if can(regex("^10\\.", nic.computed_ip))])
}

output "vm_id" {
  value = opennebula_virtual_machine.vm.id
}

output "vm_name" {
  value = opennebula_virtual_machine.vm.name
}
