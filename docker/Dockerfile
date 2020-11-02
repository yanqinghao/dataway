ARG DOCKER_BASE

FROM ${DOCKER_BASE}:3-openjdk-11

ARG PYTHON_VERSION=3.7

ENV PYPI_MIRROR "https://mirrors.aliyun.com/pypi/simple"

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/*  && apt-get clean

RUN apt-get update && \
    apt-get install -y software-properties-common libsasl2-dev && \
    apt-get clean

RUN apt-get update && \
    apt-get install -y curl python${PYTHON_VERSION} python${PYTHON_VERSION}-dev python3-distutils gcc g++ && \
    apt-get clean

RUN rm -f /usr/bin/python && ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python

RUN curl https://bootstrap.pypa.io/get-pip.py | python

RUN pip config set global.index-url ${PYPI_MIRROR}

RUN pip install --upgrade pip && pip install suanpan

WORKDIR /home/dataway

COPY . /home/dataway

RUN mkdir -p /root/.m2 && cp -f utils/settings.xml /root/.m2/ && chmod +x ./run.sh

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]

CMD ["mvn"]
