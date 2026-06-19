@echo off
REM Compilation script for Windows
REM This script compiles the thesis with all necessary steps

echo ========================================
echo Compiling Thesis...
echo ========================================

REM First compilation
echo Step 1/7: Running pdflatex (first pass)...
pdflatex -interaction=nonstopmode Thesis.tex

REM Generate glossaries
echo Step 2/7: Generating glossaries...
makeindex -s Thesis.ist -t Thesis.alg -o Thesis.acr Thesis.acn
makeindex -s Thesis.ist -t Thesis.slg -o Thesis.syi Thesis.sbl
makeindex -s Thesis.ist -t Thesis.glg -o Thesis.gls Thesis.glo

REM Generate bibliography (if using BibTeX)
echo Step 3/7: Generating bibliography...
bibtex Thesis

REM Second compilation
echo Step 4/7: Running pdflatex (second pass)...
pdflatex -interaction=nonstopmode Thesis.tex

REM Third compilation
echo Step 5/7: Running pdflatex (third pass)...
pdflatex -interaction=nonstopmode Thesis.tex

REM Fourth compilation (to ensure all references are correct)
echo Step 6/7: Running pdflatex (fourth pass)...
pdflatex -interaction=nonstopmode Thesis.tex

echo Step 7/7: Compilation complete!
echo ========================================
echo Output file: Thesis.pdf
echo ========================================

pause
