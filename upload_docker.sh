Upload_docker.sh

#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath='04193007/capstone'

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login 
docker tag capstone 04193007/capstone:latest

# Step 3:
# Push image to a docker repository
docker push 04193007/capstone:latest
