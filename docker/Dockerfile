ARG DOCKER_BASE

ARG TAG

FROM ${DOCKER_BASE}:${TAG} as builder

RUN cd /home/hasor && mvn clean install

WORKDIR /home/dataway

COPY . /home/dataway

RUN mvn clean install package

FROM openjdk:8

ARG PYTHON_VERSION=3.7

ENV PYPI_MIRROR "https://mirrors.aliyun.com/pypi/simple"

RUN apt-get update && \
    apt-get install -y software-properties-common libsasl2-dev && \
    apt-get install -y curl python${PYTHON_VERSION} python${PYTHON_VERSION}-dev python3-distutils gcc g++ && \
    apt-get clean

RUN rm -f /usr/bin/python && ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python

RUN curl https://bootstrap.pypa.io/get-pip.py | python

RUN pip config set global.index-url ${PYPI_MIRROR}

RUN pip install --upgrade pip && pip install suanpan && cd /home/hasor && mvn clean install

WORKDIR /home/dataway

COPY --from=builder /home/dataway/run.sh /home/dataway/run.sh

COPY --from=builder /home/dataway/dataway/target/dataway-1.0.0.jar /home/dataway/dataway-1.0.0.jar

RUN chmod +x ./run.sh && mkdir -p config

CMD ["bash"]
