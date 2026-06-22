#!/bin/bash
# Compilation script for Linux/Mac
# This script compiles the thesis with all necessary steps

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check for required LaTeX tools
echo "========================================"
echo "Checking LaTeX installation..."
echo "========================================"

MISSING_TOOLS=()

if ! command_exists pdflatex; then
    MISSING_TOOLS+=("pdflatex")
fi

if ! command_exists makeindex; then
    MISSING_TOOLS+=("makeindex")
fi

if ! command_exists bibtex; then
    MISSING_TOOLS+=("bibtex")
fi

if [ ${#MISSING_TOOLS[@]} -ne 0 ]; then
    echo "❌ ERROR: The following LaTeX tools are not installed:"
    for tool in "${MISSING_TOOLS[@]}"; do
        echo "   - $tool"
    done
    echo ""
    echo "Please install LaTeX on your system:"
    echo ""
    echo "Ubuntu/Debian:"
    echo "  sudo apt-get update"
    echo "  sudo apt-get install texlive-full"
    echo ""
    echo "Fedora/RHEL:"
    echo "  sudo dnf install texlive-scheme-full"
    echo ""
    echo "Arch Linux:"
    echo "  sudo pacman -S texlive-most"
    echo ""
    echo "macOS (with Homebrew):"
    echo "  brew install --cask mactex"
    echo ""
    echo "For a minimal installation (faster, ~500MB):"
    echo "  Ubuntu/Debian: sudo apt-get install texlive-latex-base texlive-latex-extra"
    echo ""
    echo "========================================"
    exit 1
fi

echo "✓ All required LaTeX tools are installed"
echo ""
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
