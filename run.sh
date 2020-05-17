#!/usr/bin/env bash

docker run -v $(pwd):/latex --rm -it briandavis/latex /latex/compile.sh ${1}
