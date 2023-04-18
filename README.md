https://docs.hetzner.cloud/#locations

# Mordhau Docker Server with Terraform on Hetzner Cloud

Easily set up your own Mordhau server on Hetzner Cloud in just 10 steps! This Terraform configuration allows you to create a Mordhau server within 10 minutes.

This script will buy you a server on Hetzner Cloud, install docker there and start docker container for Mordhau server.

Docker image taken from: [CM2Walki/Mordhau](https://github.com/CM2Walki/Mordhau)

[Create a Hetzner account with this referral link](https://hetzner.cloud/?ref=LuxOtOncziy9) to receive free 20 Euros, which can cover up to 2 months of free Mordhau server hosting!

## Setup

1. **Create a Hetzner account**: If you haven't done so already, sign up for a Hetzner account using this [referral link](https://hetzner.cloud/?ref=LuxOtOncziy9).

2. **Add an SSH key to your Hetzner account**: [Follow this guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) to create your own SSH key (if you still dont have one), than add it to your Hetzner account. Save the SSH fingerprint for later use.

3. **Create an API token**: Log in to your Hetzner account, go to the API tokens section, and create a new API token. Save the generated token.

4. **Download and install Terraform**: If you haven't already, download and install the Terraform CLI from their [official download page](https://www.terraform.io/downloads.html).

5. **Create your own variables file**: Run the following command to copy the example variables file to your own `terraform.tfvars` file:

```sh
./mordhau_hetzner.sh cp-variables
```

6. **Edit variables**: Open the `terraform.tfvars` file in a text editor and modify the variables to match your preferences, such as server location, server type, and Mordhau server settings.

7. **Start the server**: Run the following command to start the server:

```sh
./mordhau_hetzner.sh start
```

8. **Wait for the server to start**: It may take approximately 3-8 minutes for the server to download all necessary files and start.

9. **Check the server**: If your server doesn't appear in the Mordhau server browser, connect to it via SSH by running the following command:

```sh
./mordhau_hetzner.sh ssh
```

If you don't have jq installed, get ip address using

```sh
./mordhau_hetzner.sh ip
```

And use your ssh client to connect to VM.

Then, check the Docker logs for any issues.

```sh
docker logs mordhau2-dedicated -f
```

10. **Shutdown the server**: When you're done using the server, run the following command to shut it down:

```sh
./mordhau_hetzner.sh shutdown
```

## Contributing

Contributions are welcome! Please feel free to open an issue or submit a pull request with any improvements, bug fixes, or suggestions.

## Questions

Please open a question in discussion tab, I'll be glad to help you ASAP!
