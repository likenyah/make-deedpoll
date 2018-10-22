PROJECT_NAME := make-deedpoll
VERSION      := 2.0.0

template := deed-poll-template.tex
source   := deed-poll.tex


PHONY := default
default: help

PHONY += clean
clean:
	@latexmk -c -silent

PHONY += distclean
distclean:
	@rm -f $(source) $(source:.tex=.pdf)
	@latexmk -C -silent

PHONY += help
help:
	@echo '$(PROJECT_NAME) version $(VERSION)'
	@echo 'Copyright © 2017-2018 scherzoso'
	@echo
	@echo '          (*) indicates the default target(s)'
	@echo
	@echo 'Targets:'
	@echo '      clean - Remove temporary files'
	@echo '  distclean - Remove all temporary files and shipped files'
	@echo '*      help - Display this help text'
	@echo '        pdf - Generate $(source:.tex=.pdf)'
	@echo


pdf: $(source)
	@echo 'LATEXMK  $@'
	@latexmk -pdflua -silent $<

$(source): $(template)
	sed $< >$@ \
		-e "s@ADDRESS@$(ADDRESS)@" \
		-e "s@CITY@$(CITY)@" \
		-e "s@COUNTY@$(COUNTY)@" \
		-e "s@NEWNAME@$(NEWNAME)@" \
		-e "s@OLDNAME@$(OLDNAME)@" \
		-e "s@POSTCODE@$(POSTCODE)@" \
		-e "s@VERSION@$(VERSION)@"


.PHONY: $(PHONY)
