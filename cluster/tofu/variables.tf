variable "nodes" {
  description = "List of nodes"

  type = list(object({
    name = string
    ip   = string
    role = string
    user = string
  }))

  default = [
    {
      name = "controlplane"
      ip   = "" # Add your instance IP address
      role = "master"
      user = "" # Add your instance username
    }
  ]
}
