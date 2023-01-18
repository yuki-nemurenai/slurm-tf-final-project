variable "instance_group_name" {
  type        = string
}

variable "labels" {
  type 	      = map(string)
}

variable "cidr_blocks" {
  type	      = list(list(string))
}

variable "resources" {
  type = object({
    disk = number
    cpu = number
    memory = number
  })
}

variable "public_ssh_key_path" {
  type = string
  default = ""
}

variable "private_ssh_key_path" {
  type = string
  default = ""
}

variable "az" {
  type = list(string)
  default = [
    "ru-central1-a",
    "ru-central1-b",
    "ru-central1-c"
  ]
}

variable "scale_count" {
  type = number
}

variable "folder_id" {
  type = string
}

variable "image_name" {
  type = string
}

variable "image_tag" {
 type = number
}
