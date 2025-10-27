@echo off
echo ========================================
echo   GitHub Answer Files Upload Script
echo   Dr. Husam Al-Kanani - Linux Exam
echo ========================================
echo.

echo Step 1: Initialize Git Repository (if needed)
git init
git remote add origin https://github.com/husam05/linux-exam-answers.git

echo.
echo Step 2: Add all answer files
git add sheet-A-answers.md
git add sheet-B-answers.md
git add sheet-C-answers.md
git add sheet-D-answers.md
git add sheet-E-answers.md
git add sheet-F-answers.md

echo.
echo Step 3: Commit files
git commit -m "Add Linux exam answer keys for all 6 sheets (A-F)"

echo.
echo Step 4: Push to GitHub
git push origin master

echo.
echo ✅ Answer files uploaded to GitHub!
echo 🔗 Repository: https://github.com/husam05/linux-exam-answers
echo.
echo Next steps:
echo 1. Verify files are in your private repository
echo 2. Test authentication system with students
echo 3. Monitor access logs during exam
echo.
pause