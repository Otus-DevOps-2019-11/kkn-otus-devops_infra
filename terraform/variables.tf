variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west3"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable provisioners_ssh_key {
  description = "private SSH key for provisioners"
}

variable zone {
  description = "Project Zone"
  default     = "europe-west3-a"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit DB"
  default = "reddit-db-base"
}
