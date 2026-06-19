#!/bin/bash
# Compilation script for Linux/Mac
# This script compiles the thesis with all necessary steps

echo "========================================"
echo "Compiling Thesis..."
echo "========================================"

# Create output directory if it doesn't exist
mkdir -p output

# First compilation
echo "Step 1/7: Running pdflatex (first pass)..."
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex

# Generate glossaries
echo "Step 2/7: Generating glossaries..."
makeindex -s Thesis.ist -t output/Thesis.alg -o output/Thesis.acr output/Thesis.acn
makeindex -s Thesis.ist -t output/Thesis.slg -o output/Thesis.syi output/Thesis.sbl
makeindex -s Thesis.ist -t output/Thesis.glg -o output/Thesis.gls output/Thesis.glo

# Generate bibliography (if using BibTeX)
echo "Step 3/7: Generating bibliography..."
bibtex output/Thesis

# Second compilation
echo "Step 4/7: Running pdflatex (second pass)..."
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex

# Third compilation
echo "Step 5/7: Running pdflatex (third pass)..."
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex

# Fourth compilation (to ensure all references are correct)
echo "Step 6/7: Running pdflatex (fourth pass)..."
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex

echo "Step 7/7: Compilation complete!"
echo "========================================"
echo "Output file: output/Thesis.pdf"
echo "========================================"
