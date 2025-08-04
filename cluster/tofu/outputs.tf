output "nodes" {
  value     = local.nodes
  sensitive = true
}

output "inventory_files" {
  description = "Generated Ansible inventory file"

  value = {
    yaml_inventory = local_file.ansible_inventory.filename
  }
}
