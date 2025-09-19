# Makefile for LaTeX document compilation

# Document name (without .tex extension)
DOC = ai_econometrics

# LaTeX compiler
LATEX = pdflatex

# BibTeX compiler
BIBTEX = bibtex

# Default target
all: $(DOC).pdf

# Compile PDF
$(DOC).pdf: $(DOC).tex
	$(LATEX) $(DOC).tex
	$(LATEX) $(DOC).tex
	@echo "PDF compilation complete: $(DOC).pdf"

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.out *.fdb_latexmk *.fls
	@echo "Auxiliary files cleaned"

# Clean all generated files including PDF
clean-all: clean
	rm -f $(DOC).pdf
	@echo "All generated files cleaned"

# Force rebuild
rebuild: clean-all all

# Display help
help:
	@echo "Available targets:"
	@echo "  all        - Compile the LaTeX document to PDF (default)"
	@echo "  clean      - Remove auxiliary files"
	@echo "  clean-all  - Remove all generated files including PDF"
	@echo "  rebuild    - Clean all files and rebuild PDF"
	@echo "  help       - Display this help message"

.PHONY: all clean clean-all rebuild help