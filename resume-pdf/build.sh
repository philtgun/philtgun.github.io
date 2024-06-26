#!/usr/bin/env bash
sed -e '/+++/,/+++/d' -e 's/<small>/\\small /g' -e 's/<\/small>/\\normalsize/g' -e 's/{: .spaced :}//g' ../cv.md > /tmp/preproc_resume.md
pandoc --latex-engine=xelatex -H formatting.tex title.md /tmp/preproc_resume.md extra.md -o resume.pdf
