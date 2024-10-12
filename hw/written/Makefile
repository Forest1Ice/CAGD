hw4.pdf: hw4.tex
	xelatex hw4.tex
	xelatex hw4.tex
	$(MAKE) clean

hw4: hw4.pdf
	@echo "hw4 is up to date."

clean:
	@for file in hw*; do \
		if [[ "$$file" != *.tex && "$$file" != *.pdf ]]; then \
			rm -f "$$file"; \
		fi; \
	done

.PHONY: clean
