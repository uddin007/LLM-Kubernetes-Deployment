#!/bin/bash

# Set the GCP project
gcloud config set project ${GCP_PROJECT_ID}

# Export the project ID and region
export PROJECT_ID=$(gcloud config get project)
export REGION=us-east4

# Create the GKE cluster
gcloud container clusters create llm-deploy --location ${REGION} \
--workload-pool ${PROJECT_ID}.svc.id.goog --enable-image-streaming --node-locations=$REGION-a \
--machine-type n2d-standard-4 --num-nodes 1 \
--release-channel=rapid

# Get cluster credentials
gcloud container clusters get-credentials llm-deploy --region=${REGION}
