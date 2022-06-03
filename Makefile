PROJ = main
FIGS = figures/*.tex
FIGOUT =
MAIN =  $(PROJ).tex
SECTIONS = *.tex
APPENDICES =
BIB = cite.bib cryptobib/*.bib
FULL = $(MAIN) $(FIGS) $(FIGOUT) $(SECTIONS) $(APPENDICES) $(BIB)

.PHONY: all
all: main.pdf

main.pdf: $(FULL)
	pdflatex -shell-escape $(MAIN)
	bibtex 	 $(PROJ)
	pdflatex -shell-escape $(MAIN)
	pdflatex -shell-escape $(MAIN)

cryptobib/crypto.bib:
	git submodule update --init

.PHONY: zip
zip: $(PROJ).zip

$(PROJ).zip: $(FULL) $(PROJ).pdf Makefile
	zip $@ $(PROJ).pdf $(FULL) Makefile
