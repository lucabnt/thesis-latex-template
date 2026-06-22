# Quick Start Guide

This guide will help you get started with the thesis template in 5 minutes.

## Step 1: Install LaTeX (if not already installed)

**Note:** The compilation scripts will automatically check if LaTeX is installed and provide detailed installation instructions if needed.

### Windows
- **[MiKTeX](https://miktex.org/download)** (Recommended) - Easier, automatic package installation
- **[TeX Live](https://www.tug.org/texlive/windows.html)** (Alternative) - More complete

### Mac
- **[MacTeX](https://www.tug.org/mactex/mactex-download.html)** - Full distribution
- Or via Homebrew: `brew install --cask mactex`

### Linux
```bash
# Ubuntu/Debian - Full installation (recommended)
sudo apt-get update
sudo apt-get install texlive-full

# OR minimal installation (faster, ~500MB)
sudo apt-get install texlive-latex-base texlive-latex-extra

# Fedora/RHEL
sudo dnf install texlive-scheme-full

# Arch Linux
sudo pacman -S texlive-most
```

## Step 2: Customize Your Thesis

Open `config.tex` and update your information:

```latex
\newcommand{\thesisTitle}{Your Thesis Title Here}
\newcommand{\thesisAuthor}{Your Name}
\newcommand{\thesisDegree}{Master of Science}
\newcommand{\thesisDepartment}{Your Department}
\newcommand{\thesisUniversity}{Your University}
\newcommand{\thesisDate}{June 2024}
```

## Step 3: Choose Your Frontispiece Option

### Option A: University-Provided Word Frontispiece (Recommended)
If your university provides an official Word frontispiece:
1. Fill out the Word document
2. Save as PDF: `Frontespizio.pdf`
3. In `Thesis.tex` (line ~124), uncomment the PDF option and comment out the LaTeX titlepage

### Option B: Use LaTeX Title Page (Default)
The template includes a centered LaTeX title page. Customize it in `Thesis.tex` (line ~131).

## Step 4: Edit Your Content

1. **Abstract**: Edit `Abstract.tex` with your thesis summary
2. **Chapters**: Edit `Chapter_1.tex`, `Chapter_2.tex`, `Chapter_3.tex`
3. **Conclusion**: Edit `Conclusion.tex`
4. **Bibliography**: Edit `Bibliography.tex` or `References.bib`

## Step 5: Add Your Figures

1. Place images in the `figures/` folder
2. Reference them in your chapters:
   ```latex
   \includegraphics[width=0.8\linewidth]{figures/your_image.png}
   ```

## Step 6: Compile Your Thesis

### Easy Way (Recommended)

The compilation scripts will:
- ✅ Check if LaTeX is installed (and show instructions if not)
- ✅ Create the `output/` directory automatically
- ✅ Compile with all necessary steps
- ✅ Generate `output/Thesis.pdf`

**Windows**: Double-click `compile.bat`

**Linux/Mac**:
```bash
chmod +x compile.sh
./compile.sh
```

**Important:** If you see "pdflatex: command not found", LaTeX is not installed. The script will show you exactly how to install it for your system.

### Using LaTeX Editor

Open `Thesis.tex` in your LaTeX editor and click "Build" or "Compile"

## Step 7: Check Your Output

Your compiled thesis will be in: **`output/Thesis.pdf`**

## Common First-Time Issues

**Problem**: "pdflatex: command not found" or "comando non trovato"
- **Solution**: LaTeX is not installed. Run the compilation script - it will show you exactly how to install LaTeX for your operating system.

**Problem**: Missing packages
- **Solution**: MiKTeX will prompt to install them automatically. Click "Yes"

**Problem**: Can't find Thesis.pdf
- **Solution**: The PDF is now in the `output/` folder. Look for `output/Thesis.pdf`

**Problem**: Compilation errors
- **Solution**: Check that all `.tex` files are in the same folder

**Problem**: Bibliography not showing
- **Solution**: Run the compilation script (it compiles multiple times automatically)

## Next Steps

1. Read the full [README.md](README.md) for detailed instructions
2. Customize formatting in `config.tex`
3. Add your abbreviations in `Lists.tex`
4. Start writing your chapters!

## Need Help?

- Check [README.md](README.md) for detailed documentation
- See the Troubleshooting section in README.md
- Visit [TeX Stack Exchange](https://tex.stackexchange.com/)

---

**You're ready to start writing! 🎓**