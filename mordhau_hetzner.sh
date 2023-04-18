#!/bin/sh

start() {
  terraform init
  terraform plan --var-file=terraform.tfvars
  terraform apply --var-file=terraform.tfvars
}

shutdown() {
  terraform destroy --var-file=terraform.tfvars
}

ip() {
  terraform output
}

ssh_vm() {
  # Get the terraform output in json format
  output=$(terraform output -json)

  # Extract the IP address using 'jq' command
  ip_address=$(echo "$output" | jq -r '."server_ip_ubuntu-22-04".value')

  # Check if the IP address is empty
  if [ -z "$ip_address" ]; then
    echo "Failed to extract IP address from the Terraform output."
    exit 1
  fi

  # Print the IP address for debugging
  echo "Extracted IP address: $ip_address"

  # SSH to the server
  ssh root@"$ip_address"
}

cp_variables() {
  cp terraform.tfvars.example terraform.tfvars
}

pre_commit() {
  terraform fmt
  terraform validate
}

get_hetzner_location() {
  hetzner_cloud_api_token="$1"
  curl -s -H "Authorization: Bearer $hetzner_cloud_api_token" 'https://api.hetzner.cloud/v1/locations' | jq '.locations[] | {name, city, country}'
}

case "$1" in
  start)
    start
    ;;
  shutdown)
    shutdown
    ;;
  ip)
    ip
    ;;
  ssh)
    ssh_vm
    ;;
  cp-variables)
    cp_variables
    ;;
  pre-commit)
    pre_commit
    ;;
  get-hetzner-location)
    get_hetzner_location "$2"
    ;;
  *)
    echo "Usage: $0 {start|shutdown|ip|ssh|cp-variables|pre-commit|get-hetzner-location}"
    exit 1
    ;;
esac
