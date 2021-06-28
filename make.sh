#!/bin/bash

set -e
# yum install -y pandoc 
# yum install -y texlive-xetex texlive-mathspec texlive-euenc texlive-fontaxes texlive-xltxtra texlive-xecjk texlive-framed texlive-placeins texlive-titlesec texlive-everypage
# yum install texlive-pdftex texlive-latex-bin texlive-texconfig* texlive-latex* texlive-metafont* texlive-cmap* texlive-ec texlive-fncychap* texlive-pdftex-def texlive-fancyhdr* texlive-titlesec* texlive-multirow texlive-framed* texlive-wrapfig* texlive-parskip* texlive-caption texlive-ifluatex* texlive-collection-fontsrecommended texlive-collection-latexrecommended
# rpm -ivh texlive-background-svn33100.2.1-18.el7.noarch.rpm
# rpm -ivh texlive-mweights-svn31268.0-18.el7.noarch.rpm
# rpm -ivh texlive-sourcesanspro-svn31970.2.2-18.el7.noarch.rpm 
# rpm -ivh texlive-sourcecodepro-svn32006.2.2-18.el7.noarch.rpm

# yum -y install fontconfig ttmkfdir
# reference: https://www.cnblogs.com/dfsxh/p/11416474.html


# test passed in pandoc 1.19.1

MAINFONT="WenQuanYi Zen Hei"
MONOFONT="WenQuanYi Zen Hei Mono"

# MAINFONT="Tsentsiu Sans HG"
# MONOFONT="Tsentsiu Sans Console HG"

#_version_tag="$(date '+%Y%m%d').$(git rev-parse --short HEAD)"
_version_tag="$(date '+%Y%m%d')"

# default version: `pandoc --latex-engine=xelatex doc.md -s -o output2.pdf`
# used to debug template setting error

# add docs versions
# generate PDF for dev version

output_path="output.pdf"

pandoc -N --toc --smart --latex-engine=xelatex \
--template=template.tex \
--listings \
--columns=80 \
-V title="DorisDB 使用手册" \
-V author="DorisDB Inc." \
-V CJKmainfont="${MAINFONT}" \
-V mainfont="${MAINFONT}" \
-V sansfont="${MAINFONT}" \
-V monofont="${MONOFONT}" \
-V date="${_version_tag}" \
-V geometry:margin=1in \
-V include-after="\\input{copyright.tex}" \
"./doc.md" -s -o "output.pdf"