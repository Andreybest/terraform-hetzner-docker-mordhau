# Output Server Public IP address 
output "server_ip_ubuntu-22-04" {
  description = "IPv4 of a created server"
  value       = hcloud_server.mordhau-cx31-ubuntu-22-04.ipv4_address
}
