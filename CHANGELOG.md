# Changelog

All notable changes to this thesis template will be documented in this file.

## [1.1.0]

### Fixed
- Template did not compile: removed `arabtex`, `academicons` and `breakcites`,
  which were loaded but never used (`breakcites` no longer ships with TeX Live)
- `\usepackage{utf8}` resolved to ArabTeX's file, not an input encoding;
  replaced with `\usepackage[utf8]{inputenc}`
- Glossary, abbreviation and symbol lists were never generated: the compile
  scripts looked for `Thesis.ist` in the repository root instead of `output/`
- BibTeX ran unconditionally and printed two errors on every manual-bibliography
  build; it is now skipped unless the document actually uses it
- Front matter numbering was hardcoded (`\setcounter{page}{3,5,7,14}`) and broke
  as soon as a section grew; front matter is now lowercase roman and the
  bibliography and appendices continue the arabic sequence
- Duplicate PDF destinations made table-of-contents links jump to the wrong page
- PDF embedded Type 3 bitmap fonts; `fontenc` + `lmodern` now give outlines
- `\include{Lists}` in the preamble, `headheight` too small for `fancyhdr`,
  and two document class options that do not exist
- `anotherauthor2022` was cited but absent from `References.bib`
- `\def\-1/-2/-3` overwrote each other and destroyed `\-`, LaTeX's manual
  hyphenation command; shorthands are now `\dg` and `\pow{...}`, declared once
  in `config.tex` with `\newcommand` and `\ensuremath`
- README offered the template under MIT terms, which no file granted; it is
  CC BY 4.0, the same licence as the KAUST original

### Changed
- `config.tex` is now read by `Thesis.tex` and actually drives the document;
  entries are marked LIVE or MANUAL
- `\useBibTeX` in `config.tex` switches between the manual bibliography
  (default) and BibTeX, with no other edit needed
- Removed unused or superseded packages: `epsfig`, `graphics`, `latexsym`,
  `lipsum`, `blindtext`; `lscape` replaced by `pdflscape`
- Replaced `subfigure`, deprecated since 2003, with `subcaption`; cross-references
  to panels now read `1.1a` instead of `1.1(a)`, and sub-captions no longer
  appear in the List of Figures
- `.gitignore` now also covers artifacts built in the repository root
- `compile.sh` is committed with its executable bit set

## [1.0.0] - 2024-06-19

### Added
- Initial release of the LaTeX thesis template
- Main thesis structure with modular chapter files
- Comprehensive README.md with detailed documentation
- Quick start guide (QUICKSTART.md)
- Configuration file (config.tex) for easy customization
- Compilation scripts for Windows (compile.bat) and Linux/Mac (compile.sh)
- Support for glossaries, abbreviations, and symbols
- Bibliography support (both manual and BibTeX)
- Multiple appendices support
- Example chapters with LaTeX usage examples
- .gitignore file for LaTeX projects
- Placeholder files for figures and data
- Professional formatting with customizable options
- Two-sided and one-sided printing support
- Automatic generation of Table of Contents, List of Figures, and List of Tables

### Features
- Clean, professional layout based on completed thesis
- Well-commented code for easy understanding
- Modular structure for easy maintenance
- Support for multiple languages (English and Italian abstracts)
- Comprehensive documentation
- Ready-to-use examples for figures, tables, equations, and citations

### Documentation
- Complete README with installation, usage, and troubleshooting
- Quick start guide for beginners
- In-file comments explaining LaTeX commands
- Folder-specific README files for organization

## Future Enhancements (Planned)

### Potential Additions
- [ ] Additional chapter templates (Results, Discussion)
- [ ] More bibliography style examples
- [ ] Cover page templates for different universities
- [ ] Makefile for automated compilation
- [ ] Docker container for consistent LaTeX environment
- [ ] CI/CD integration examples
- [ ] Additional language support
- [ ] More figure and table examples
- [ ] Template for conference paper format
- [ ] Integration with reference managers (Zotero, Mendeley)

### Improvements Under Consideration
- [ ] Simplified configuration system
- [ ] More customization options
- [ ] Better error handling in compilation scripts
- [ ] Additional documentation for advanced features
- [ ] Video tutorials
- [ ] Web-based configuration tool

---

## Version History

- **1.0.0** (2024-06-19): Initial release

---

## Contributing

If you have suggestions for improvements or find issues, please document them clearly with:
- Description of the issue or enhancement
- Steps to reproduce (for issues)
- Expected vs actual behavior
- Your LaTeX distribution and version

---

## Notes

This template is based on a completed Master's thesis and follows common academic formatting standards. Always verify that the template meets your institution's specific requirements before final submission.