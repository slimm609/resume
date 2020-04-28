#!/usr/bin/env bash

rm -rf output || true

typeList=('casual' 'oldstyle' 'banking' 'classic')
colorList=('blue' 'green' 'grey' 'orange' 'purple' 'red')

for type in ${typeList[@]}; do
  mkdir -p output/${type}
  sed "s/TYPE/$type/" resume.tex > render-${type}.tex
  for color in ${colorList[@]}; do
    sed "s/COLOR/$color/" render-${type}.tex > render-${type}-${color}.tex
    pdflatex render-${type}-${color}.tex
    mv render-${type}-${color}.pdf output/${type}/
  done
done

rm render*




