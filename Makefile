.DEFAULT_GOAL := all

# latexmk also accepts the existing source without a .tex extension.
SOURCE ?= HW-Template
BUILD_DIR ?= build
LATEXMK ?= latexmk
LATEXMK_FLAGS ?= -pdf -interaction=nonstopmode -halt-on-error -file-line-error

.PHONY: all clean distclean

# Let latexmk track dependencies and rerun LaTeX as needed.
all:
	$(LATEXMK) $(LATEXMK_FLAGS) -outdir="$(BUILD_DIR)" "$(SOURCE)"

# Remove intermediate files, keeping the PDF.
clean:
	$(LATEXMK) -c -outdir="$(BUILD_DIR)" "$(SOURCE)"

# Remove intermediate files and the PDF.
distclean:
	$(LATEXMK) -C -outdir="$(BUILD_DIR)" "$(SOURCE)"
