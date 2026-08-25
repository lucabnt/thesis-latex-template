# LaTeX Thesis Template

A LaTeX template for Master's and PhD theses: modular chapters, automatic
front matter, glossaries, and a bibliography you can drive either by hand or
with BibTeX.

It compiles cleanly out of the box (no errors, no missing packages, no bitmap
fonts) on TeX Live and MiKTeX. It is a starting point, not a finished thesis:
check the result against your institution's own formatting rules before you
submit.

**New here?** Follow [QUICKSTART.md](QUICKSTART.md) — seven steps, about five
minutes. This file is the full reference; [CHANGELOG.md](CHANGELOG.md) records
what changed between versions.

## ✨ What you get

- Modular chapters, appendices, and two abstracts (English and Italian)
- Table of contents, list of figures, list of tables — all generated
- Lists of abbreviations and symbols via `glossaries`
- Bibliography by hand or through BibTeX, switched from one setting
- Roman front matter, arabic main matter, no hardcoded page numbers
- Vector fonts only, so the PDF stays sharp and PDF/A-compatible
- One-command compilation on Windows, Linux, and macOS
- Central `config.tex` for title, author, margins, spacing, and font sizes

## 🔧 Requirements

You need a LaTeX distribution. The compilation scripts check for one and print
these instructions if it is missing.

**Windows** — [MiKTeX](https://miktex.org/download) (recommended: smaller
download, installs missing packages on demand) or
[TeX Live](https://www.tug.org/texlive/windows.html).

**macOS** — [MacTeX](https://www.tug.org/mactex/), or `brew install --cask mactex`.

**Linux**

```bash
# Ubuntu/Debian - full installation (~4GB, nothing left to think about)
sudo apt-get update
sudo apt-get install texlive-full

# OR minimal installation (~1GB) - these cover every package used here
sudo apt-get install texlive-latex-base texlive-latex-recommended \
                     texlive-latex-extra texlive-fonts-recommended \
                     lmodern

# Fedora/RHEL
sudo dnf install texlive-scheme-full

# Arch Linux
sudo pacman -S texlive-most
```

`lmodern` is a separate package on Debian and Ubuntu: without it the PDF falls
back to bitmap fonts, which look blurry and are rejected by some submission
systems.

An editor helps but is optional: [TeXstudio](https://www.texstudio.org/),
[TeXmaker](https://www.xm1math.net/texmaker/),
[VS Code](https://code.visualstudio.com/) with LaTeX Workshop, or
[Overleaf](https://www.overleaf.com/) online.

### Packages used

`amsmath`, `amssymb`, `amsthm` (mathematics) · `graphicx`, `subcaption`
(figures and side-by-side panels) · `hyperref` (links) · `glossaries`
(abbreviations and symbols) · `fancyhdr`, `geometry`, `setspace` (page layout)
· `fontenc` with `lmodern` (outline fonts) · `etoolbox` (drives the
bibliography switch) · `listings`, `longtable`, `multirow`, and others — see
the preamble of `Thesis.tex` for the full list.

## 📁 Project structure

```
Thesis.tex          Main file: preamble, and the order everything is included in
config.tex          Your settings: title, author, margins, spacing, bibliography mode
Abstract.tex        English abstract
Abstract_IT.tex     Italian abstract (optional)
Acknowledgment.tex  Acknowledgments (optional, not included by default)
Lists.tex           Abbreviations, symbols, glossary entries
Chapter_1.tex       Introduction, with worked examples of every element
Chapter_2.tex       Literature review
Chapter_3.tex       Methodology
Conclusion.tex      Conclusion
Bibliography.tex    Manual bibliography (the default)
References.bib      BibTeX database (used when \useBibTeX is true)
Appendix_A.tex      Appendix A
Appendix_B.tex      Appendix B
compile.sh          Compilation script for Linux and macOS
compile.bat         Compilation script for Windows
figures/            Your images
data/               Data and analysis code
output/             Everything the compiler produces, including Thesis.pdf
```

Add a chapter by creating `Chapter_4.tex` and adding `\include{Chapter_4}` to
`Thesis.tex`, next to the others. Appendices work the same way, inside the
`\appendix` block.

## ⚙️ Configuration

Open `config.tex`. Every entry is marked:

- **LIVE** — change it there and recompile.
- **MANUAL** — LaTeX cannot read it from that file (it is a document class
  option, or an `\include` switch); the comment says where to change it.

| Setting | | |
|---|---|---|
| `\thesisTitle`, `\thesisTitleIT` | LIVE | Title page and the two abstracts |
| `\thesisAuthor`, `\thesisDegree` | LIVE | Title page and abstracts |
| `\thesisDepartment`, `\thesisUniversity`, `\thesisDate` | LIVE | Title page |
| `\supervisorOne`, `\supervisorTwo` | MANUAL | Uncomment the marked lines in the title page block |
| `\thesisLineSpacing` | LIVE | 1.25 for one-and-a-half, 1.667 for double |
| `\chapterFontSize`, `\sectionFontSize` | LIVE | Heading sizes, in points |
| `\leftMargin`, `\rightMargin`, `\topMargin`, `\bottomMargin` | LIVE | Page margins |
| `\useBibTeX` | LIVE | `false` for the manual bibliography, `true` for BibTeX |
| `\bibliographyStyle` | LIVE | BibTeX style, when `\useBibTeX` is true |
| `\printingSide` | MANUAL | A `\documentclass` option at the top of `Thesis.tex` |
| `\includeItalianAbstract`, `\includeAcknowledgments` | MANUAL | Comment or uncomment the matching `\include` line |

`config.tex` also holds shorthands you can use in the text, and is the right
place to add your own:

```latex
\newcommand{\dg}{\ensuremath{^\circ}}      % 25\dg C
\newcommand{\pow}[1]{\ensuremath{^{#1}}}   % m\pow{2}, s\pow{-1}
```

Declare them with `\newcommand`, not `\def`: if the name is already taken you
get an error instead of silently breaking an existing command.

## 📄 Title page

`Thesis.tex` offers two options, marked `OPTION 1` and `OPTION 2` in a comment
block near `\begin{document}`.

**Option 1 — your university's PDF frontispiece.** Many institutions provide
an official Word cover page. Fill it in, export it as `Frontespizio.pdf` into
the project folder, then uncomment the three lines of the `OPTION 1` block and
comment out the `OPTION 2` titlepage below it. This guarantees compliance and
keeps official logos intact.

**Option 2 — the LaTeX title page (default).** Its text comes from
`config.tex`; only the layout lives in `Thesis.tex`.

## ✍️ Writing your thesis

`Chapter_1.tex` contains a worked example of every element below — the fastest
way to learn the syntax is to read it.

**Figures.** Put images in `figures/`.

```latex
\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\linewidth]{figures/your_image.png}
    \caption{Descriptive caption}
    \label{fig:your_label}
\end{figure}
```

Reference with `see Figure \ref{fig:your_label}`. For side-by-side panels use
the `subfigure` environment from `subcaption`; each panel takes an explicit
width and its own `\caption`, and `\ref` then yields `1.1a`, `1.1b`.

**Tables.**

```latex
\begin{table}[h]
\centering
\caption{Your caption}
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

**Abbreviations and symbols.** Define them in `Lists.tex`:

```latex
\newacronym{ai}{AI}{Artificial Intelligence}

\newglossaryentry{symb:alpha}{
  name=$\alpha$, type=symbols,
  description={Significance level}, sort=symbolalpha}
```

Then use `\gls{ai}` in the text: the first occurrence expands to "Artificial
Intelligence (AI)", later ones stay short. Entries you never use do not appear
in the lists — that is by design, not a bug.

## 📚 Bibliography

The default is a manual bibliography: you write the entries by hand in
`Bibliography.tex`, and cite works in the text by author and year.

To use BibTeX instead, put your entries in `References.bib` and set one value
in `config.tex`:

```latex
\newcommand{\useBibTeX}{true}
```

Nothing else changes. `\cite{author2023}` starts working, the generated
bibliography replaces the manual page, and `\bibliographyStyle` chooses the
format (`plain`, `abbrv`, `alpha`, `unsrt`, `apalike`, `IEEEtran`, …).

## 🚀 Compiling

**With the scripts (recommended).** They check that LaTeX is installed, create
`output/`, and run every pass in the right order — including the glossary and
bibliography steps that are easy to forget.

```bash
# Windows: double-click compile.bat, or run it in a terminal
compile.bat

# Linux and macOS
./compile.sh
```

The result is `output/Thesis.pdf`.

**By hand,** if you need to drive the process yourself:

```bash
mkdir -p output
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex
makeindex -s output/Thesis.ist -t output/Thesis.alg -o output/Thesis.acr output/Thesis.acn
makeindex -s output/Thesis.ist -t output/Thesis.slg -o output/Thesis.syi output/Thesis.sbl
makeindex -s output/Thesis.ist -t output/Thesis.glg -o output/Thesis.gls output/Thesis.glo
bibtex output/Thesis          # only when \useBibTeX is true
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex   # three more passes
```

The `.ist` style file is written into `output/`, so `makeindex` must be pointed
there. Several passes are needed because the table of contents and the
cross-references only settle once every page number is known.

**From an editor,** set the compiler to `pdflatex` and enable the BibTeX and
makeindex steps, or simply call the script as an external build command.

## 🔍 Troubleshooting

**`pdflatex: command not found`** — LaTeX is not installed. See
[Requirements](#-requirements); the scripts print the same instructions.

**Missing packages** — MiKTeX offers to install them: accept. On TeX Live,
install the collections listed under Requirements.

**Blurry PDF, or a submission system rejecting the fonts** — `lmodern` is
missing. On Debian and Ubuntu it is a separate package.

**Bibliography or glossaries do not appear** — run the full sequence. A single
`pdflatex` pass cannot produce them.

**Page numbers or references look wrong** — compile again; three passes are the
minimum, and the scripts run four.

**`File not found`** — every `.tex` file must sit next to `Thesis.tex`.

**Figures do not show** — check that the file really is in `figures/` and that
the path in `\includegraphics` matches, extension included.

**Cannot find the PDF** — it is `output/Thesis.pdf`, not in the project root.

Still stuck? Read the LaTeX error message from the top: the first error is the
real one, the rest are usually its consequences. If that does not help,
[TeX Stack Exchange](https://tex.stackexchange.com/) almost certainly has your
case.

## 📝 Working habits that pay off

- Commit early and often; the `.gitignore` already excludes build artifacts.
- Keep backups somewhere other than your laptop.
- Compile after every substantial change, so an error has one obvious cause.
- Name labels for what they are: `fig:methodology_flowchart`, not `fig:fig1`.
- One chapter per file, and let `Thesis.tex` decide the order.

## 🙏 Credits and licence

This template descends from the
[KAUST Official Thesis Template](https://www.overleaf.com/latex/templates/kaust-official-thesis-template/mrcyxjvwpqdn),
distributed under CC BY 4.0. It was adapted for a Master's thesis defended in
2023 at the University of Pavia and the University of Tübingen, then stripped
of all thesis-specific content and rebuilt as a generic template: restructured
front matter, cross-platform compilation scripts, worked examples for every
element, and central configuration.

Licensed under [CC BY 4.0](LICENSE), the same terms as the original. You may
use, adapt, and redistribute it, including commercially, as long as the
attribution above is preserved. See [LICENSE](LICENSE) for the full text.

Improvements are welcome: describe the problem, test your change, and explain
what you altered and why.
