variable "source_image_family" {
  type = string
  default = "centos-7"
}

variable "ssh_username" {
  type = string
  default = "centos"
}

variable "use_ipv4_nat" {
  type = string
  default = "true"
}

variable "image_description" {
  type = string
  default = "Centos Defaulf Image"
}

variable "image_family" {
  type = string
  default = "centos-7-default"
}

variable "image_name" {
  type = string
  default = "centos"
}

variable "image_tag" {
  type = number
  default = 1
}

variable "disk_type" {
  type = string
  default = "network-hdd"
}


