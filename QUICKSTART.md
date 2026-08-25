# Quick Start

Seven steps, about five minutes. Everything here is covered in more depth in
[README.md](README.md).

## 1. Install LaTeX

MiKTeX on Windows, MacTeX on macOS, TeX Live on Linux. Exact commands for each
system are in [Requirements](README.md#-requirements).

Not sure whether you have it? Just run the compilation script in step 6 — it
checks, and prints what to install if anything is missing.

## 2. Fill in your details

Open `config.tex` and set your information. It is read by `Thesis.tex`, so
these values reach the title page and the abstracts directly:

```latex
\newcommand{\thesisTitle}{Your Thesis Title Here}
\newcommand{\thesisAuthor}{Your Name}
\newcommand{\thesisDegree}{Master of Science}
\newcommand{\thesisDepartment}{Your Department}
\newcommand{\thesisUniversity}{Your University}
\newcommand{\thesisDate}{June 2026}
```

Margins, line spacing, and heading sizes live in the same file.

## 3. Choose a title page

If your university provides an official cover page, export it as
`Frontespizio.pdf` and switch to `OPTION 1` in `Thesis.tex`. Otherwise the
LaTeX title page is already in place and takes its text from step 2. See
[Title page](README.md#-title-page).

## 4. Write

- `Abstract.tex` — your summary, 150–300 words
- `Chapter_1.tex` … `Chapter_3.tex`, then `Conclusion.tex`
- `Appendix_A.tex`, `Appendix_B.tex` if you need them
- `Lists.tex` — abbreviations and symbols

`Chapter_1.tex` contains a worked example of every element — figures, tables,
equations, citations, abbreviations. Read it once before you start.

## 5. Add figures

Put images in `figures/`, then:

```latex
\includegraphics[width=0.8\linewidth]{figures/your_image.png}
```

## 6. Compile

**Windows:** double-click `compile.bat`.

**Linux and macOS:**

```bash
./compile.sh
```

The script creates `output/`, runs every pass in the right order, and tells you
what to install if LaTeX is missing.

## 7. Read the result

Your thesis is `output/Thesis.pdf`.

---

## References

By default you write them by hand in `Bibliography.tex` and cite by author and
year. To use BibTeX instead, put your entries in `References.bib` and set
`\useBibTeX` to `true` in `config.tex` — nothing else changes. See
[Bibliography](README.md#-bibliography).

## If something goes wrong

Most first-time problems are one of these:

- **`pdflatex: command not found`** — LaTeX is not installed; go back to step 1.
- **Missing packages** — MiKTeX offers to install them, accept.
- **The bibliography or the abbreviations are missing** — use the script rather
  than a single `pdflatex` pass; they need extra steps.
- **You cannot find the PDF** — it is in `output/`, not in the project root.

The full list is in [Troubleshooting](README.md#-troubleshooting).

---

**You're ready to start writing. 🎓**
