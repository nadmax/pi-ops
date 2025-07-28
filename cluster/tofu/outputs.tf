output "nodes" {
    description = "All configured nodes"

    value = {
        for node in var.nodes : node.name => {
            ip   = node.ip
            role = node.role
            user = node.user
        }
    }
}

output "inventory_files" {
    description = "Generated Ansible inventory file"

    value = {
        yaml_inventory = local_file.ansible_inventory.filename
    }
}
