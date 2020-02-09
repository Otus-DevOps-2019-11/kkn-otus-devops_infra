variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable projectzone {
  description = "Project Zone"
  default     = "europe-west3-a"
}

variable db_disk_image {
  description = "Disk image for reddit DB"
  default = "reddit-db-base"
}
