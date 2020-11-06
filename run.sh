#!/bin/bash

python tools/download_config_files.py

cd ../hasor

mvn clean install

cd ../dataway/dataway

mvn clean install org.springframework.boot:spring-boot-maven-plugin:run
