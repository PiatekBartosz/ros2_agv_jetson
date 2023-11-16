# define a registry to push the images to
export REGISTRY=piatekbartosz
# create new buildx that support multiple platforms
docker buildx create --use  --driver-opt network=host --name MultiPlatform

# build the image for two different platforms and push the images
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -f ROS2_foxy.Dockerfile \
  -t ${REGISTRY}/ros2_base:latest \
  --push .