@echo off
REM Compilation script for Windows
REM This script compiles the thesis with all necessary steps

echo ========================================
echo Checking LaTeX installation...
echo ========================================

REM Check if pdflatex is available
where pdflatex >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: pdflatex is not installed or not in PATH
    echo.
    echo Please install LaTeX on your system:
    echo.
    echo Option 1 - MiKTeX ^(Recommended for Windows^):
    echo   Download from: https://miktex.org/download
    echo   - Easier to use, automatic package installation
    echo   - Smaller initial download
    echo.
    echo Option 2 - TeX Live:
    echo   Download from: https://www.tug.org/texlive/windows.html
    echo   - More complete distribution
    echo   - Larger download ^(~4GB^)
    echo.
    echo After installation, restart your terminal and try again.
    echo ========================================
    pause
    exit /b 1
)

echo All required LaTeX tools are installed
echo.
echo ========================================
echo Compiling Thesis...
echo ========================================

REM Create output directory if it doesn't exist
if not exist "output" mkdir output

REM First compilation
echo Step 1/7: Running pdflatex (first pass)...
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex

REM Generate glossaries
echo Step 2/7: Generating glossaries...
makeindex -s Thesis.ist -t output\Thesis.alg -o output\Thesis.acr output\Thesis.acn
makeindex -s Thesis.ist -t output\Thesis.slg -o output\Thesis.syi output\Thesis.sbl
makeindex -s Thesis.ist -t output\Thesis.glg -o output\Thesis.gls output\Thesis.glo

REM Generate bibliography (if using BibTeX)
echo Step 3/7: Generating bibliography...
bibtex output\Thesis

REM Second compilation
echo Step 4/7: Running pdflatex (second pass)...
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex

REM Third compilation
echo Step 5/7: Running pdflatex (third pass)...
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex

REM Fourth compilation (to ensure all references are correct)
echo Step 6/7: Running pdflatex (fourth pass)...
pdflatex -interaction=nonstopmode -output-directory=output Thesis.tex

echo Step 7/7: Compilation complete!
echo ========================================
echo Output file: output\Thesis.pdf
echo ========================================

pause
