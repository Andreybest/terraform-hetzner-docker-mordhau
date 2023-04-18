terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.38.2"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

# Obtain ssh key data
data "hcloud_ssh_key" "ssh_key" {
  fingerprint = var.ssh_fingerprint
}

locals {
  user_data = templatefile("${path.module}/mordhau_docker_server.sh.tpl", {
    SERVER_ADMINPW       = var.server_adminpw
    SERVER_PW            = var.server_pw
    SERVER_NAME          = var.server_name
    SERVER_MAXPLAYERS    = var.server_maxplayers
    SERVER_TICKRATE      = var.server_tickrate
    SERVER_PORT          = var.server_port
    SERVER_QUERYPORT     = var.server_queryport
    SERVER_BEACONPORT    = var.server_beaconport
    SERVER_GAMEINI       = var.server_gameini
    SERVER_ENGINEINI     = var.server_engineini
    SERVER_DEFAULTMAP    = var.server_defaultmap
    STEAMCMD_UPDATE_ARGS = var.steamcmd_update_args
    ADDITIONAL_ARGS      = var.additional_args
  })
}

# Create Ubuntu 22.04 server
resource "hcloud_server" "mordhau-cx31-ubuntu-22-04" {
  name        = var.name
  image       = var.image
  server_type = var.server_type
  location    = var.location
  ssh_keys    = ["${data.hcloud_ssh_key.ssh_key.id}"]
  user_data   = local.user_data
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
