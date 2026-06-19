# Quick Start Guide

This guide will help you get started with the thesis template in 5 minutes.

## Step 1: Install LaTeX (if not already installed)

### Windows
Download and install [MiKTeX](https://miktex.org/download)

### Mac
Download and install [MacTeX](https://www.tug.org/mactex/mactex-download.html)

### Linux
```bash
sudo apt-get install texlive-full  # Ubuntu/Debian
sudo dnf install texlive-scheme-full  # Fedora
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

## Step 3: Edit Your Content

1. **Abstract**: Edit `Abstract.tex` with your thesis summary
2. **Chapters**: Edit `Chapter_1.tex`, `Chapter_2.tex`, `Chapter_3.tex`
3. **Conclusion**: Edit `Conclusion.tex`
4. **Bibliography**: Edit `Bibliography.tex` or `References.bib`

## Step 4: Add Your Figures

1. Place images in the `Figure/` folder
2. Reference them in your chapters:
   ```latex
   \includegraphics[width=0.8\linewidth]{Figure/your_image.png}
   ```

## Step 5: Compile Your Thesis

### Easy Way (Recommended)

**Windows**: Double-click `compile.bat`

**Linux/Mac**: 
```bash
chmod +x compile.sh
./compile.sh
```

### Using LaTeX Editor

Open `Thesis.tex` in your LaTeX editor and click "Build" or "Compile"

## Step 6: Check Your Output

Your compiled thesis will be: `Thesis.pdf`

## Common First-Time Issues

**Problem**: Missing packages
- **Solution**: MiKTeX will prompt to install them automatically. Click "Yes"

**Problem**: Compilation errors
- **Solution**: Check that all `.tex` files are in the same folder

**Problem**: Bibliography not showing
- **Solution**: Run the compilation script (it compiles multiple times)

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