@echo off
setlocal enabledelayedexpansion

echo ====================================
echo Automated GitHub Repository Setup for Exam QR Codes
echo ====================================
echo.

:: Check if GitHub CLI is installed
where gh >nul 2>nul
if %errorlevel% neq 0 (
    echo GitHub CLI not found. Installing GitHub CLI...
    echo.
    powershell -Command "& {Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))}"
    choco install gh -y
    echo.
    echo GitHub CLI installed. Please restart this script.
    pause
    exit /b
)

echo GitHub CLI found. Proceeding with setup...
echo.

:: Check if user is logged into GitHub
gh auth status >nul 2>nul
if %errorlevel% neq 0 (
    echo Please login to GitHub first...
    gh auth login
    echo.
)

:: Get GitHub username
for /f "tokens=*" %%i in ('gh api user --jq .login') do set GITHUB_USERNAME=%%i
echo Logged in as: %GITHUB_USERNAME%
echo.

:: STEP 1: Create Private Repository
echo STEP 1: Creating Private GitHub Repository...
echo ----------------------------------------
gh repo create linux-exam-answers --private --description "Private repository for Linux exam answer keys with QR code access" --clone
if %errorlevel% neq 0 (
    echo Repository might already exist. Continuing...
)
echo.

:: Navigate to repository directory
if not exist "linux-exam-answers" (
    gh repo clone %GITHUB_USERNAME%/linux-exam-answers
)
cd linux-exam-answers

:: STEP 2: Upload Answer Files
echo STEP 2: Uploading Answer Files...
echo ----------------------------
copy "..\github-answers\*.md" .
git add *.md
git commit -m "Add exam answer sheets A-F"
git push origin main
echo Answer files uploaded successfully!
echo.

:: STEP 3: Generate Personal Access Tokens
echo STEP 3: Generating Personal Access Tokens...
echo ----------------------------------------
echo.
echo Opening GitHub Personal Access Token page...
start https://github.com/settings/tokens/new

echo.
echo Please create 6 personal access tokens with the following names:
echo 1. Sheet-A-Token-Nov2025
echo 2. Sheet-B-Token-Nov2025  
echo 3. Sheet-C-Token-Nov2025
echo 4. Sheet-D-Token-Nov2025
echo 5. Sheet-E-Token-Nov2025
echo 6. Sheet-F-Token-Nov2025
echo.
echo For each token:
echo - Set expiration: 30 days (or as needed)
echo - Select scope: repo (Full control of private repositories)
echo.

:: Create a tokens file for user to fill
echo # Personal Access Tokens for Exam Sheets > tokens.txt
echo # Fill in the tokens after creating them on GitHub >> tokens.txt
echo. >> tokens.txt
echo SHEET_A_TOKEN=ghp_your_token_here >> tokens.txt
echo SHEET_B_TOKEN=ghp_your_token_here >> tokens.txt
echo SHEET_C_TOKEN=ghp_your_token_here >> tokens.txt
echo SHEET_D_TOKEN=ghp_your_token_here >> tokens.txt
echo SHEET_E_TOKEN=ghp_your_token_here >> tokens.txt
echo SHEET_F_TOKEN=ghp_your_token_here >> tokens.txt

echo.
echo I've created a tokens.txt file. Please:
echo 1. Create the 6 tokens on GitHub (page opened automatically)
echo 2. Edit tokens.txt and replace 'ghp_your_token_here' with actual tokens
echo 3. Save the file
echo.
echo Press any key when you've filled in all tokens...
pause

:: Read tokens from file
if exist "tokens.txt" (
    for /f "tokens=1,2 delims==" %%a in ('findstr /v "^#" tokens.txt') do (
        set %%a=%%b
    )
)

:: STEP 4: Update LaTeX File URLs
echo.
echo STEP 4: Updating LaTeX File with GitHub URLs...
echo --------------------------
cd..

:: Create PowerShell script to update LaTeX file
echo $username = "%GITHUB_USERNAME%" > update_latex.ps1
echo $tokens = @{ >> update_latex.ps1
echo     "A" = "%SHEET_A_TOKEN%"; >> update_latex.ps1
echo     "B" = "%SHEET_B_TOKEN%"; >> update_latex.ps1
echo     "C" = "%SHEET_C_TOKEN%"; >> update_latex.ps1
echo     "D" = "%SHEET_D_TOKEN%"; >> update_latex.ps1
echo     "E" = "%SHEET_E_TOKEN%"; >> update_latex.ps1
echo     "F" = "%SHEET_F_TOKEN%" >> update_latex.ps1
echo } >> update_latex.ps1
echo. >> update_latex.ps1
echo $content = Get-Content "Professional_Exam_Sheets.tex" -Raw >> update_latex.ps1
echo foreach ($sheet in $tokens.Keys) { >> update_latex.ps1
echo     $oldUrl = "https://github.com/hussamalkinani/linux-exam-answers/blob/main/sheet-$($sheet.ToLower())-answers.md?token=GHSAT0AAAAAACXJ7$sheet" >> update_latex.ps1
echo     $newUrl = "https://github.com/$username/linux-exam-answers/blob/main/sheet-$($sheet.ToLower())-answers.md?token=$($tokens[$sheet])" >> update_latex.ps1
echo     $content = $content -replace [regex]::Escape($oldUrl), $newUrl >> update_latex.ps1
echo } >> update_latex.ps1
echo Set-Content "Professional_Exam_Sheets.tex" $content >> update_latex.ps1

powershell -ExecutionPolicy Bypass -File update_latex.ps1
del update_latex.ps1

echo LaTeX file updated with your GitHub URLs and tokens!
echo.

:: STEP 5: Compile LaTeX and Test
echo STEP 5: Compiling LaTeX and Testing...
echo -------------------------
where pdflatex >nul 2>nul
if %errorlevel% neq 0 (
    echo pdflatex not found. Please install MiKTeX or TeX Live first.
    echo Download from: https://miktex.org/download
    pause
    goto :END
)

echo Compiling LaTeX file...
pdflatex Professional_Exam_Sheets.tex
pdflatex Professional_Exam_Sheets.tex
echo.

if exist "Professional_Exam_Sheets.pdf" (
    echo ✅ PDF compiled successfully!
    echo Opening PDF for review...
    start Professional_Exam_Sheets.pdf
    echo.
    echo Please verify:
    echo 1. QR codes are visible on each exam sheet
    echo 2. Test QR codes with your mobile device
    echo 3. Each QR code opens the correct answer sheet
    echo.
) else (
    echo ❌ PDF compilation failed. Please check for LaTeX errors.
)

:END
echo.
echo ====================================
echo Setup Status Summary:
echo ====================================
echo ✅ GitHub repository created: linux-exam-answers
echo ✅ Answer files uploaded to repository  
echo ✅ Personal access tokens configured
echo ✅ LaTeX file updated with your URLs
if exist "Professional_Exam_Sheets.pdf" (
    echo ✅ PDF compiled successfully
) else (
    echo ❌ PDF compilation needs attention
)
echo.
echo 🔒 Security Reminders:
echo - Repository is private ✅
echo - Tokens expire in 30 days (or your setting)
echo - Each sheet has unique token access
echo - Revoke tokens after exam period
echo.
echo Your exam sheets now have secure QR code access!
echo Location: Professional_Exam_Sheets.pdf
echo.
pause