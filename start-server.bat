@echo off
echo Starting Exam Authentication Server...
echo.
echo ================================
echo  Linux Exam Answer Access System
echo  Dr. Husam Al-Kanani
echo  Mustafa University
echo ================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    echo Please install Python 3.7+ to run this server
    pause
    exit /b 1
)

REM Install Flask if not already installed
echo Installing required packages...
pip install flask >nul 2>&1

REM Start the server
echo Starting server on http://localhost:5000
echo.
echo QR Code URLs should point to:
echo - Sheet A: http://localhost:5000?sheet=A
echo - Sheet B: http://localhost:5000?sheet=B  
echo - Sheet C: http://localhost:5000?sheet=C
echo - Sheet D: http://localhost:5000?sheet=D
echo - Sheet E: http://localhost:5000?sheet=E
echo - Sheet F: http://localhost:5000?sheet=F
echo.
echo Press Ctrl+C to stop the server
echo.

python exam-server.py

pause