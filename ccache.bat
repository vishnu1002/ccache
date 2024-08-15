@echo off

:: Check for administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ Requesting Administrator Access...]
    powershell start -verb runas '%0'
    exit /b
)

:: Clear Cache by Vishnu

title Clear Cache
cls

echo.
echo [ CLEAR ALL CACHE ]
echo.

echo ===========================================================================
echo.
echo [ Cleaning Windows Temp ]
echo.
del /s /f /q C:\Windows\Temp\*.*
echo.

echo ===========================================================================
echo.
echo [ Cleaning Windows Prefetch ]
echo.
del /s /f /q C:\Windows\Prefetch\*.*
echo.

echo ===========================================================================
echo.
echo [ Cleaning User Temp (% TEMP %) ]
echo.
del /s /f /q %TEMP%\*.*
echo.

echo ===========================================================================
echo.
echo [ Cleaning LocalAppData Temp ]
echo.
del /s /f /q %LOCALAPPDATA%\Temp\*.*
echo.

echo ===========================================================================
echo.
echo [ CLEARING SOFTWARE DISTRIBUTION CACHE ]
echo.
rmdir /s /q C:\Windows\SoftwareDistribution\Download\
echo.

echo ===========================================================================
echo.
echo [ CLEARING NVIDIA CACHE ]
echo.
rmdir /s /q C:\ProgramData\NVIDIA\
rmdir /s /q C:\Users\%USERNAME%\AppData\Local\NVIDIA\
echo.

echo ===========================================================================
echo.
echo [ CLEARING AMD CACHE ]
echo.
rmdir /s /q C:\Users\%USERNAME%\AppData\Local\AMD\DxCache\
rmdir /s /q C:\Users\%USERNAME%\AppData\Local\AMD\VkCache\
echo.

echo ===========================================================================
echo.
echo [ DNS FLUSH AND WINSOCK RESET ]
ipconfig /flushdns
netsh winsock reset 
echo.

echo ===========================================================================
echo.
echo All cache files cleared.
echo.

PAUSE
