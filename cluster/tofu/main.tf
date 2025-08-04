data "sops_file" "secrets" {
    source_file = "${path.module}/secrets/secrets.enc.yml"
}

locals {
    node_secrets = yamldecode(data.sops_file.secrets.raw)
    nodes = length(local.node_secrets.nodes) > 0 ? [for n in local.node_secrets.nodes : {
      name = n.name
      ip   = n.ip
      role = n.role
      user = n.user
  }] : var.nodes
}

resource "local_file" "ansible_inventory" {
    filename = "${path.module}/../ansible/inventory/hosts.yml"

    content = templatefile("${path.module}/templates/hosts.yml.tpl", {
        nodes = local.nodes
    })
}
