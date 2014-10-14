#
# Makefile
# ronan, 2014-10-14 10:34
# ALTERNATIVE: http://gitprint.com
#

MARKDOWN = pandoc --from markdown_github --to html --standalone 
all: $(patsubst %.md,%.html,$(wildcard *.md)) Makefile

clean:

	rm -f $(patsubst %.md,%.html,$(wildcard *.md))
	rm -f *.bak *~

%.html: %.md
	$(MARKDOWN) $< --output $@

# vim:ft=make
#

