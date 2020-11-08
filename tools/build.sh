#!/bin/bash

set -e

VERSION=$(bash tools/version.sh)
DOCKERBASE="registry-vpc.cn-shanghai.aliyuncs.com/shuzhi-amd64/suanpan-hasor-base"
if [[ $1 == "master" ]]; then
    echo "build from suanpan-hasor-base"
    echo "build suanpan-dataway:latest and ${VERSION}"
    BUILD_VERSIONS=${VERSION}
    BUILD_TAGS="latest"
else
    echo "build from suanpan-hasor-base"
    echo "build suanpan-dataway:preview and preview-${VERSION}"
    BUILD_VERSIONS="preview-${VERSION}"
    BUILD_TAGS="preview"
fi
BUILDNAMES="suanpan-dataway"
NAMESPACE="shuzhi-amd64"

docker build --pull --no-cache --build-arg DOCKER_BASE=${DOCKERBASE} \
    --build-arg TAG=${BUILD_TAGS} -t \
    registry-vpc.cn-shanghai.aliyuncs.com/${NAMESPACE}/${BUILDNAMES}:${BUILD_VERSIONS} \
    -f docker/Dockerfile .
docker push registry-vpc.cn-shanghai.aliyuncs.com/${NAMESPACE}/${BUILDNAMES}:${BUILD_VERSIONS}

docker tag registry-vpc.cn-shanghai.aliyuncs.com/${NAMESPACE}/${BUILDNAMES}:${BUILD_VERSIONS} \
    registry-vpc.cn-shanghai.aliyuncs.com/${NAMESPACE}/${BUILDNAMES}:${BUILD_TAGS}
docker push registry-vpc.cn-shanghai.aliyuncs.com/${NAMESPACE}/${BUILDNAMES}:${BUILD_TAGS}
