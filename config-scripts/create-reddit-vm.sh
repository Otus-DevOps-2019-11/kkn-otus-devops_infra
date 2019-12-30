gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image=reddit-full-1577731514 \
  --image-project=infra-7777777 \
  --machine-type=f1-micro \
  --tags puma-server \
  --restart-on-failure
