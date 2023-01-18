variable "source_image_family" {
  type = string
  default = "centos-7"
  description = "Source image family name to create custom image"
}

variable "ssh_username" {
  type = string
  default = "centos"
  description = "SSH User"
}

variable "use_ipv4_nat" {
  type = string
  default = "true"
  description = "NAT to get external IP (true or false value)"
}

variable "image_description" {
  type = string
  default = "Centos 7 Nginx Image"
  description = "Description of Packer Image"
}

variable "image_family" {
  type = string
  default = "centos-7-nginx"
  description = "Packer image family"
}

variable "image_name" {
  type = string
  default = "nginx"
  description = "Packer image name"
}
variable "image_tag" {
  type = number
  default = 1
  description = "Packer image tag"
}

variable "disk_type" {
  type = string
  default = "network-hdd"
  description = "Disk using template"
}


