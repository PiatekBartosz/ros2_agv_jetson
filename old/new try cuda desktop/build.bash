docker buildx create --use  --driver-opt network=host --name MultiPlatform

# build the image for two different platforms and push the images
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -f Dockerfile \
  -t output \
  --push .