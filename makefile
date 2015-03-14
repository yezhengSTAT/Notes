%.md: %.Rmd
	R -e 'library(knitr);knit("$(<F)")'

%.pdf: %.tex
	pdflatex $(<F);bibtex $(<F);pdflatex $(<F);pdflatex $(<F)

%.tex: %.Rnw
	R CMD Sweave --engine=knitr::knitr --pdf $(<F)

%.pdf: %.md
	pandoc $(<F) -o $@
