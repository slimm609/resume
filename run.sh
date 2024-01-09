#!/usr/bin/env bash

docker run -v $(pwd)/latex:/latex --rm -it briandavis/latex:latest /latex/compile.sh ${1}

rm -rf output/

mv latex/output output