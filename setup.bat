@echo off
echo ==========================================
echo winbot Setup Script
echo ==========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed
    echo Please install Python 3.8+ and try again
    pause
    exit /b 1
)

echo [OK] Python found

REM Create virtual environment
echo.
echo Creating virtual environment...
python -m venv venv

if errorlevel 1 (
    echo Error: Failed to create virtual environment
    pause
    exit /b 1
)

echo [OK] Virtual environment created

REM Activate virtual environment
echo.
echo Activating virtual environment...
call venv\Scripts\activate.bat

if errorlevel 1 (
    echo Error: Failed to activate virtual environment
    pause
    exit /b 1
)

echo [OK] Virtual environment activated

REM Install dependencies
echo.
echo Installing dependencies...
pip install -r requirements.txt

if errorlevel 1 (
    echo Error: Failed to install dependencies
    pause
    exit /b 1
)

echo [OK] Dependencies installed

REM Copy config template
echo.
if exist config.yaml (
    echo Warning: config.yaml already exists, skipping copy
) else (
    echo Copying config template...
    copy config-example.yaml config.yaml >nul
    echo [OK] config.yaml created from template
)

REM Final instructions
echo.
echo ==========================================
echo Setup Complete!
echo ==========================================
echo.
echo Next steps:
echo 1. Get the shared credentials from Luan (via Signal or secure method)
echo 2. Edit config.yaml and paste in the credentials
echo 3. Run the bot with: python winbot.py
echo.
echo To activate the virtual environment in the future, run:
echo   venv\Scripts\activate.bat
echo.
echo See SETUP.md for more detailed instructions.
echo.
pause
