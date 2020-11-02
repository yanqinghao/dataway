#!/bin/bash

set -e

python tools/download_config_files.py

cd dataway

mvn clean install org.springframework.boot:spring-boot-maven-plugin:run
