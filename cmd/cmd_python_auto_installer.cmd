@echo off

set PYTHON_VERSION=3.12.3
set PYTHON_INSTALLER_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-amd64.exe
set INSTALLER_FILE=python-%PYTHON_VERSION%-amd64.exe

echo Downloading Python installer...
curl -o %INSTALLER_FILE% %PYTHON_INSTALLER_URL%

echo Installing Python...
%INSTALLER_FILE% /quiet InstallAllUsers=1 PrependPath=1 Include_launcher=1

rem Step 3: Add Python to PATH temporarily
echo Adding Python to PATH temporarily...
set "PATH=%PATH%;C:\Program Files\Python312;C:\Program Files\Python312\Scripts"

rem Step 4: Verify Installation
echo Verifying Python installation...
python --version

rem Step 4: Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

rem Step 5: Install Python Packages
echo Installing Python packages from requirements.txt...
pip install -r requirements.txt

rem Step 5: Clean Up
echo Cleaning up...
del INSTALLER_FILE

echo Python 3.9 installation completed.
pause
