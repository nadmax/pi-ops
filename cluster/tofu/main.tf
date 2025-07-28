resource "local_file" "ansible_inventory" {
    filename = "${path.module}/../ansible/inventory/hosts.yml"

    content = templatefile("${path.module}/templates/hosts.yml.tpl", {
        nodes = var.nodes
    })
}
