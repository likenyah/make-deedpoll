.POSIX:

.PHONY: all clean distclean deed-poll
.SUFFIXES:
.SUFFIXES: .pdf .tex

all: deed-poll

clean:
	latexmk -c -silent

distclean:
	latexmk -C -silent

deed-poll: deed-poll.pdf

.tex.pdf:
	latexmk -silent -synctex=1 $<
