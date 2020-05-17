#!/usr/bin/env bash
name=${1:-render}

rm -rf output || true

typeList=('casual' 'oldstyle' 'banking' 'classic')
colorList=('blue' 'green' 'grey' 'orange' 'purple' 'red')
#colorList=('orange')

for type in ${typeList[@]}; do
  mkdir -p output/standard/${type}
  sed "s/TYPE/$type/" resume.tex > render-${type}.tex
  for color in ${colorList[@]}; do
    sed "s/COLOR/$color/" render-${type}.tex > render-${type}-${color}.tex
    pdflatex render-${type}-${color}.tex
    mv render-${type}-${color}.pdf output/standard/${type}/${name}-${type}-${color}.pdf
  done
done

rm render*

# change type because not all look proper with a cover letter
typeList=('casual' 'banking' 'classic')
sed -e '/COVERPAGE/r cover.tex' resume.tex > resume-cover.tex
for type in ${typeList[@]}; do
  mkdir -p output/cover/${type}
  sed "s/TYPE/$type/" resume-cover.tex > render-${type}.tex
  for color in ${colorList[@]}; do
    sed "s/COLOR/$color/" render-${type}.tex > render-${type}-${color}.tex
    pdflatex render-${type}-${color}.tex
    mv render-${type}-${color}.pdf output/cover/${type}/${name}-${type}-${color}.pdf
  done
done

rm resume-cover.tex
rm render*
