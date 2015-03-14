Using Rmarkdown in Emacs
===============================

knit(input file) it will give us the corresponding .md file

shell command: make test.pdf

shell command: gnome-open test.pdf

The makefile contains command to transform .md files into pdf files

%.md: %.Rmd
	R -e 'library(knitr);knit("$(<F)")'

%.pdf: %.tex
	pdflatex $(<F);bibtex $(<F);pdflatex $(<F);pdflatex $(<F)

%.tex: %.Rnw
	R CMD Sweave --engine=knitr::knitr --pdf $(<F)

%.pdf: %.md
	pandoc $(<F) -o $@




emacs comman:

shell command: alt+shift+1

terminal: alt+x shell
