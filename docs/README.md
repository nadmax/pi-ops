# Documentation

## What is my setup?

My setup is:

- 8 Raspberry Pi 5 (8GB RAM)
- 8 Active Coolers
- 1 case
- 8 Ethernet Cable
- 1 Network Switch
- 8 NVMe with associated HAT

## What can be your setup?

You don't need to have the same setup as mine.
A single VPS can be efficient.

## Where to start?

The first step is to generate your inventory.
Thanks to OpenTofu, you can do this with the following commands:

```sh
cd cluster/tofu
tofu init
tofu plan
tofu apply
```

After that, you can check if everything worked with the following commands:

```sh
cd ../ansible
ansible all -i inventory/hosts.yml -m ping
```
