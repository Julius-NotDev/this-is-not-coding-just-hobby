@echo off
title Siemens License Manager Error Repair Tool by LEE Ver.1

echo Run Tool

echo .
timeout /t 1 >nul
echo .
timeout /t 1 >nul
echo .
timeout /t 1 >nul
echo.
echo.  

powershell -Command ^
"if (Test-Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\PendingFileRenameOperations') { ^
    Remove-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager' -Name 'PendingFileRenameOperations'; ^
    Write-Host 'Erase Successfully!.' -ForegroundColor Green ^
} else { ^
    Write-Host 'There is no value to erase!' -ForegroundColor Red ^
}"

echo.
echo Repair Done!
pause
