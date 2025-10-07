output "demolab_dmz_L01_ip_lan_subnet" {
  value = one([for nic in opennebula_virtual_machine.demolab_dmz_L01.template_nic : nic.computed_ip if can(regex("^10\\.", nic.computed_ip))])
}

output "demolab_dmz_L01_id" {
  value = opennebula_virtual_machine.demolab_dmz_L01.id
}

output "demolab_dmz_L01_name" {
  value = opennebula_virtual_machine.demolab_dmz_L01.name
}
