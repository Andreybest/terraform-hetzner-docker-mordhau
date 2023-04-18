#!/bin/sh

# Step 1: Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Step 2: Create a new folder "mordhau"
echo "Creating mordhau directory..."
mkdir mordhau

# Step 3: Change directory to the newly created folder
cd mordhau

# Step 4: Create "data" folder and set permissions for Docker access
echo "Creating data directory and setting permissions..."
mkdir data
chmod 777 data

# Step 5: Create "docker-compose.yaml" file with the given content
echo "Creating docker-compose.yaml file..."
cat << EOF > docker-compose.yaml
version: '3.8'

services:
    mordhau:
        restart: 'unless-stopped'
        network_mode: host
        volumes:
            - './data:/home/steam/mordhau-dedicated/'
        environment:
            SERVER_ADMINPW: '${SERVER_ADMINPW}'
            SERVER_PW: '${SERVER_PW}'
            SERVER_NAME: '${SERVER_NAME}'
            SERVER_MAXPLAYERS: '${SERVER_MAXPLAYERS}'
            SERVER_TICKRATE: '${SERVER_TICKRATE}'
            SERVER_PORT: '${SERVER_PORT}'
            SERVER_QUERYPORT: '${SERVER_QUERYPORT}'
            SERVER_BEACONPORT: '${SERVER_BEACONPORT}'
            SERVER_GAMEINI: '${SERVER_GAMEINI}'
            SERVER_ENGINEINI: '${SERVER_ENGINEINI}'
            SERVER_DEFAULTMAP: '${SERVER_DEFAULTMAP}'
            STEAMCMD_UPDATE_ARGS: '${STEAMCMD_UPDATE_ARGS}'
            ADDITIONAL_ARGS: '${ADDITIONAL_ARGS}'
        container_name: mordhau2-dedicated
        image: cm2network/mordhau
EOF

# Step 6: Start Docker Compose in detached mode
echo "Starting Docker Compose..."
docker compose up -d

# Step 7: Start displaying logs in follow mode for the newly created container
# echo "Displaying logs..."
# docker logs -f mordhau2-dedicated
