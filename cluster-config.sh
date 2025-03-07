gcloud config set project ${secrets.GCP_PROJECT_ID}
export PROJECT_ID=$(gcloud config get project)
export REGION=us-east4
gcloud container clusters create llm-deploy --location ${REGION} \
--workload-pool ${PROJECT_ID}.svc.id.goog   --enable-image-streaming   --node-locations=$REGION-a \
--workload-pool=${PROJECT_ID}.svc.id.goog   --machine-type n2d-standard-4   --num-nodes 1  \
--release-channel=rapid
gcloud container clusters get-credentials llm-deploy --region=${REGION}
