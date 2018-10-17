PDFLATEX=/usr/bin/pdflatex
MASTER=mult-optimization-analysis.tex

.PHONY: doc
doc:
	$(PDFLATEX) -file-line-error $(MASTER)

.PHONY: clean
clean:
	@rm -rf auto
	@find . -regex '.*\.\(aux\|log\|out\|pdf\|toc\)' -exec rm {} +;
