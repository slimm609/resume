#!/usr/bin/env bash

docker run -v $(pwd):/latex --rm -it briandavis/latex pdflatex pdflatex resume.tex
