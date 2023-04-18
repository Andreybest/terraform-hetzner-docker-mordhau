variable "hcloud_token" {
  sensitive   = true
  description = "Hetzner API Key"
  type        = string
}

variable "ssh_fingerprint" {
  description = "Fingerprint of a ssh key registered at Hetzner"
  type        = string
}


variable "name" {
  description = "Name for a VM"
  type        = string
  default     = "mordhau-cx31-ubuntu-22-04"
}

variable "image" {
  description = "Image name and version for a VM"
  type        = string
  default     = "ubuntu-22.04"
}

variable "server_type" {
  description = "Server configuration for a VM"
  type        = string
  default     = "cx31"
}

variable "location" {
  description = "Location of Hetzner VM (fsn1, nbg1, hel1, ash, hil)"
  type        = string
  default     = "fsn1"
}


variable "server_adminpw" {
  description = "Mordhau Server admin password"
  type        = string
  default     = "replacethisyoumadlad"
}

variable "server_pw" {
  description = "Mordhau Server password"
  type        = string
  default     = ""
}

variable "server_name" {
  description = "Mordhau Server name"
  type        = string
  default     = "My Mordhau Server"
}

variable "server_maxplayers" {
  description = "Mordhau Server max players"
  type        = number
  default     = 32
}

variable "server_tickrate" {
  description = "Mordhau Server tick rate"
  type        = number
  default     = 60
}

variable "server_port" {
  description = "Mordhau Server port"
  type        = number
  default     = 7777
}

variable "server_queryport" {
  description = "Mordhau Server query port"
  type        = number
  default     = 27015
}

variable "server_beaconport" {
  description = "Mordhau Server beacon port"
  type        = number
  default     = 15000
}

variable "server_gameini" {
  description = "Mordhau Server game ini"
  type        = string
  default     = "cfg/Game.ini"
}

variable "server_engineini" {
  description = "Mordhau Server engine ini"
  type        = string
  default     = "cfg/Engine.ini"
}

variable "server_defaultmap" {
  description = "Mordhau Server default map"
  type        = string
  default     = "ThePit\\/FFA_ThePit"
}

variable "steamcmd_update_args" {
  description = "SteamCMD update arguments"
  type        = string
  default     = ""
}

variable "additional_args" {
  description = "Additional arguments for srcds"
  type        = string
  default     = ""
}

