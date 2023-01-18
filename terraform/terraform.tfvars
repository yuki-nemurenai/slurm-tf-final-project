instance_group_name = "nginx-group"

labels = {
  "project" = "slurm"
  "env"     = "lab"
}

cidr_blocks = [
  ["172.20.0.0/27"],
  ["172.21.0.0/27"],
  ["172.22.0.0/27"],
]

resources = {
  disk = 10
  cpu = 2
  memory = 4
}

public_ssh_key_path = ""
private_ssh_key_path = ""

scale_count = 3

image_name = "nginx"
image_tag = 1
