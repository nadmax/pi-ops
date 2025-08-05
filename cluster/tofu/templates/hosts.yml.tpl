all:
  children:
    cluster:
      hosts:
%{ for node in nodes ~}
        ${node.name}:
          ansible_host: ${node.ip}
          ansible_user: ${node.user}
          node_role: ${node.role}
%{ endfor ~}
      children:
        master: {}
        worker: {}
      vars:
        version: v1.30.14+k3s2
        token_file: /var/lib/rancher/k3s/server/node-token
        data_dir: /var/lib/rancher/k3s
    
    masters:
      hosts:
%{ for node in nodes ~}
%{ if node.role == "master" ~}
        ${node.name}:
          ansible_host: ${node.ip}
          ansible_user: ${node.user}
          node_role: ${node.role}
%{ endif ~}
%{ endfor ~}
      vars:
        role: master
        server_args: "--disable=traefik --disable=servicelb"
    
    workers:
      hosts:
%{ for node in nodes ~}
%{ if node.role == "worker" ~}
        ${node.name}:
          ansible_host: ${node.ip}
          ansible_user: ${node.user}
          node_role: ${node.role}
%{ endif ~}
%{ endfor ~}
      vars:
        role: worker

  vars:
    ansible_python_interpreter: /usr/bin/python3
    ansible_ssh_private_key_file: ~/.ssh/id_rsa
    ansible_ssh_common_args: '-o StrictHostKeyChecking=no'
