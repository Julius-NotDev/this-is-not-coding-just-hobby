@echo off
setlocal enabledelayedexpansion
color 0B
title IP Setting Tool by LEE Ver.1

echo ===============================
echo IP Type - 192.168.X.Y
echo ===============================
echo.

set /p ipInput=세 번째와 네 번째 자리 입력 (공백으로 구분): 

for /f "tokens=1,2" %%a in ("%ipInput%") do (
    set "ip3=%%a"
    set "ip4=%%b"
)

if not defined ip3 (
    echo 첫 번째 숫자가 누락되었습니다.
    goto end
)
if not defined ip4 (
    echo 두 번째 숫자가 누락되었습니다.
    goto end
)

set /a check3=!ip3!+0 2>nul
set /a check4=!ip4!+0 2>nul

if !ip3! GEQ 0 if !ip3! LEQ 255 (
    if !ip4! GEQ 0 if !ip4! LEQ 255 (
        set "fullip=192.168.!ip3!.!ip4!"
        set "interfaceName=이더넷"
        echo IP 주소 설정 중: !fullip!
        netsh interface ip set address name="!interfaceName!" static !fullip! 255.255.255.0 192.168.!ip3!.1
        echo IP 주소 설정이 완료되었습니다: !fullip!
    ) else (
        echo 두 번째 숫자가 0~255 범위를 벗어났습니다.
    )
) else (
    echo 첫 번째 숫자가 0~255 범위를 벗어났습니다.
)

:end
pause
