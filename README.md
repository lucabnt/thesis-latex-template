# LaTeX Thesis Template

A comprehensive LaTeX template for Master's and PhD theses, based on a completed thesis project. This template provides a professional structure with all necessary components for academic thesis writing.

## 📚 Documentation Files

This template includes multiple documentation files to help you get started:

- **[README.md](README.md)** (this file) - Complete documentation with detailed instructions
- **[QUICKSTART.md](QUICKSTART.md)** - 5-minute quick start guide for beginners
- **[TEMPLATE_OVERVIEW.md](TEMPLATE_OVERVIEW.md)** - Comprehensive overview of all template features
- **[CHANGELOG.md](CHANGELOG.md)** - Version history and planned enhancements

**New users**: Start with [QUICKSTART.md](QUICKSTART.md) for a fast setup!

## 📋 Table of Contents

- [Documentation Files](#documentation-files)
- [Features](#features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Quick Start](#quick-start)
- [Compilation](#compilation)
- [Customization](#customization)
- [Usage Guide](#usage-guide)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- **Professional formatting** with customizable margins, spacing, and fonts
- **Automatic generation** of Table of Contents, List of Figures, and List of Tables
- **Glossaries support** for abbreviations and symbols
- **Bibliography management** with both manual and BibTeX options
- **Multiple appendices** support
- **Two-sided and one-sided** printing options
- **Compilation scripts** for Windows, Linux, and Mac
- **Git-ready** with comprehensive `.gitignore`
- **Well-documented** with examples and comments

## 📁 Project Structure

```
Thesis-Template/
├── Thesis.tex              # Main thesis file
├── config.tex              # Configuration and customization
├── Abstract.tex            # English abstract
├── Abstract_IT.tex         # Italian abstract (optional)
├── Acknowledgment.tex      # Acknowledgments section
├── Lists.tex               # Glossaries, abbreviations, symbols
├── Chapter_1.tex           # Introduction chapter
├── Chapter_2.tex           # Literature review chapter
├── Chapter_3.tex           # Methodology chapter
├── Conclusion.tex          # Conclusion chapter
├── Bibliography.tex        # Manual bibliography
├── References.bib          # BibTeX bibliography file
├── Appendix_A.tex          # Appendix A
├── Appendix_B.tex          # Appendix B
├── compile.bat             # Windows compilation script
├── compile.sh              # Linux/Mac compilation script
├── .gitignore              # Git ignore file
├── README.md               # This file - Complete documentation
├── QUICKSTART.md           # Quick start guide for beginners
├── CHANGELOG.md            # Version history and planned features
├── TEMPLATE_OVERVIEW.md    # Comprehensive template overview
├── Figure/                 # Folder for images and figures
│   └── placeholder.txt
├── Data and Code/          # Folder for data and analysis code
│   └── README.txt
└── Final PDFs/             # Folder for final compiled PDFs
    └── README.txt
```

## 🔧 Requirements

### Essential Software

1. **LaTeX Distribution**
   - **Windows**: [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
   - **Mac**: [MacTeX](https://www.tug.org/mactex/)
   - **Linux**: TeX Live (usually available in package manager)

2. **LaTeX Editor** (recommended)
   - [TeXstudio](https://www.texstudio.org/) (cross-platform)
   - [Overleaf](https://www.overleaf.com/) (online)
   - [Visual Studio Code](https://code.visualstudio.com/) with LaTeX Workshop extension
   - [TeXmaker](https://www.xm1math.net/texmaker/)

### Required LaTeX Packages

The template uses the following packages (usually included in standard distributions):
- `amsmath`, `amssymb`, `amsthm` - Mathematical symbols and environments
- `graphicx` - Image inclusion
- `hyperref` - Hyperlinks and PDF features
- `glossaries` - Glossaries and acronyms
- `fancyhdr` - Custom headers and footers
- `geometry` - Page layout
- `setspace` - Line spacing
- `listings` - Code listings
- And many more (see `Thesis.tex` for complete list)

## 🚀 Quick Start

### Method 1: Using Compilation Scripts (Recommended)

**Windows:**
```bash
# Double-click compile.bat or run in command prompt:
compile.bat
```

**Linux/Mac:**
```bash
# Make the script executable (first time only):
chmod +x compile.sh

# Run the script:
./compile.sh
```

### Method 2: Manual Compilation

```bash
# Step 1: First LaTeX compilation
pdflatex Thesis.tex

# Step 2: Generate glossaries
makeindex -s Thesis.ist -t Thesis.alg -o Thesis.acr Thesis.acn
makeindex -s Thesis.ist -t Thesis.slg -o Thesis.syi Thesis.sbl
makeindex -s Thesis.ist -t Thesis.glg -o Thesis.gls Thesis.glo

# Step 3: Generate bibliography (if using BibTeX)
bibtex Thesis

# Step 4-6: Additional LaTeX compilations
pdflatex Thesis.tex
pdflatex Thesis.tex
pdflatex Thesis.tex
```

### Method 3: Using LaTeX Editor

Most LaTeX editors have a "Build" or "Compile" button. Configure your editor to:
1. Use `pdflatex` as the compiler
2. Enable bibliography compilation (BibTeX)
3. Enable glossary compilation (makeindex)

## 🎨 Customization

### Basic Information

Edit the `config.tex` file to customize your thesis information:

```latex
\newcommand{\thesisTitle}{Your Thesis Title Here}
\newcommand{\thesisAuthor}{Your Name}
\newcommand{\thesisDegree}{Master of Science}
\newcommand{\thesisDepartment}{Department Name}
\newcommand{\thesisUniversity}{University Name}
\newcommand{\thesisDate}{Month Year}
```

### Formatting Options

Adjust formatting in `config.tex`:

```latex
% Line spacing (1.25 for 1.5 spacing, 1.667 for 2.0 spacing)
\newcommand{\thesisLineSpacing}{1.667}

% Font sizes
\newcommand{\chapterFontSize}{14}
\newcommand{\sectionFontSize}{14}

% Page margins
\newcommand{\leftMargin}{25mm}
\newcommand{\rightMargin}{25mm}
```

### Adding Chapters

1. Create a new file: `Chapter_X.tex`
2. Add content following the structure of existing chapters
3. Include it in `Thesis.tex`:
   ```latex
   \include{Chapter_X}
   ```

### Adding Figures

1. Place your image in the `Figure/` folder
2. Include it in your chapter:
   ```latex
   \begin{figure}[h]
       \centering
       \includegraphics[width=0.8\linewidth]{Figure/your_image.png}
       \caption{Your caption here}
       \label{fig:your_label}
   \end{figure}
   ```
3. Reference it in text: `see Figure \ref{fig:your_label}`

### Adding Tables

```latex
\begin{table}[h]
\centering
\caption{Your table caption}
\label{tab:your_label}
\begin{tabular}{|l|c|r|}
\hline
\textbf{Column 1} & \textbf{Column 2} & \textbf{Column 3} \\
\hline
Data 1 & Data 2 & Data 3 \\
\hline
\end{tabular}
\end{table}
```

## 📖 Usage Guide

### Writing Your Abstract

Edit `Abstract.tex` with your thesis summary (150-300 words typically). If you don't need an Italian abstract, you can:
1. Delete `Abstract_IT.tex`
2. Comment out the line in `Thesis.tex`: `%\include{Abstract_IT}`

### Managing References

#### Option 1: Manual Bibliography (Default)

Edit `Bibliography.tex` and add entries following the format:

```latex
\hangindent=1em
\hangafter=1
Author, A. A. (Year). Title of work. Publisher.
```

#### Option 2: BibTeX (Recommended for large bibliographies)

1. Add entries to `References.bib`:
   ```bibtex
   @article{author2023,
     author = {Author, A. A.},
     title = {Title of Article},
     journal = {Journal Name},
     year = {2023},
     volume = {10},
     pages = {123-145}
   }
   ```

2. In `Thesis.tex`, uncomment the BibTeX section (lines 249-257) and comment out:
   ```latex
   %\include{Bibliography.tex}
   ```

3. Cite in text: `\cite{author2023}`

### Adding Abbreviations and Symbols

Edit `Lists.tex`:

```latex
% Add abbreviation
\newacronym{ai}{AI}{Artificial Intelligence}

% Add symbol
\newglossaryentry{symb:alpha}{
  name=$\alpha$,
  type=symbols,
  description={Significance level},
  sort=symbolalpha
}
```

Use in text:
- First use: `\gls{ai}` → "Artificial Intelligence (AI)"
- Subsequent uses: `\gls{ai}` → "AI"

### Adding Appendices

1. Create `Appendix_X.tex`
2. Add content
3. Include in `Thesis.tex`:
   ```latex
   \include{Appendix_X}
   ```

## 🔍 Troubleshooting

### Common Issues

**Problem**: "File not found" errors
- **Solution**: Ensure all `.tex` files are in the same directory as `Thesis.tex`

**Problem**: Bibliography not appearing
- **Solution**: Run the full compilation sequence (see [Compilation](#compilation))

**Problem**: Glossaries not showing
- **Solution**: Run makeindex commands and recompile

**Problem**: Figures not displaying
- **Solution**: Check that image files are in the `Figure/` folder and paths are correct

**Problem**: PDF has wrong page numbers
- **Solution**: Compile multiple times (at least 3 times) to resolve all references

### Getting Help

1. Check LaTeX error messages carefully
2. Search for error messages online (TeX Stack Exchange is helpful)
3. Verify all required packages are installed
4. Try compiling a minimal example to isolate the issue

## 📝 Best Practices

1. **Version Control**: Use Git to track changes
   ```bash
   git init
   git add .
   git commit -m "Initial thesis template"
   ```

2. **Regular Backups**: Keep multiple backups of your work
   - Cloud storage (Dropbox, Google Drive, OneDrive)
   - External hard drive
   - University servers

3. **Compile Frequently**: Compile after major changes to catch errors early

4. **Use Comments**: Document your LaTeX code with comments
   ```latex
   % This section describes the methodology
   ```

5. **Consistent Naming**: Use clear, descriptive names for files and labels
   - Good: `fig:methodology_flowchart`
   - Bad: `fig:fig1`

6. **Separate Content**: Keep each chapter in its own file for easier management

## 🤝 Contributing

Improvements and suggestions are welcome! If you find issues or have ideas for enhancements:

1. Document the issue or enhancement
2. Test your changes thoroughly
3. Submit with clear description of modifications

## 📄 License

This template is provided as-is for academic use. Feel free to modify and distribute it for educational purposes.

## 🙏 Acknowledgments

This template is based on a completed Master's thesis project and incorporates best practices from various academic institutions.

---

## 📞 Support

For questions or issues:
- Check the [Troubleshooting](#troubleshooting) section
- Consult your institution's thesis guidelines
- Refer to LaTeX documentation: [LaTeX Project](https://www.latex-project.org/)
- Visit [TeX Stack Exchange](https://tex.stackexchange.com/)

---

**Good luck with your thesis! 🎓**