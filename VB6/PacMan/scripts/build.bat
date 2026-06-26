@echo off
setlocal

REM ============================================
REM CONFIG
REM ============================================
set VB6_EXE=C:\Program Files\Microsoft Visual Studio\VB98\VB6.EXE
set PROJECT_FILE=C:\Users\vboxuser\Desktop\pacman\VB6\PacMan\PacMan.vbp
set BUILD_LOG=C:\Users\vboxuser\Desktop\pacman\VB6\PacMan\build.log

echo ============================================
echo VB6 BUILD START
echo VB6_EXE=%VB6_EXE%
echo PROJECT_FILE=%PROJECT_FILE%
echo BUILD_LOG=%BUILD_LOG%
echo ============================================

REM ============================================
REM VALIDASI
REM ============================================
if not exist "%VB6_EXE%" (
    echo [ERROR] VB6 compiler not found: %VB6_EXE%
    exit /b 1
)

if not exist "%PROJECT_FILE%" (
    echo [ERROR] Project file not found: %PROJECT_FILE%
    exit /b 1
)

REM ============================================
REM BUILD
REM ============================================
echo [INFO] Compiling project...
"%VB6_EXE%" /make "%PROJECT_FILE%" /out "%BUILD_LOG%"
set BUILD_RC=%ERRORLEVEL%

echo [INFO] VB6 return code: %BUILD_RC%

if not "%BUILD_RC%"=="0" (
    echo [ERROR] Build failed. Check build.log
    exit /b 1
)

echo [SUCCESS] Build finished successfully.
exit /b 0