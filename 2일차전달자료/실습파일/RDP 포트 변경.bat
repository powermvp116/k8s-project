@echo off

bcdedit > nul || (echo 우클릭 하여 관리자 권한으로 실행하세요. & pause & exit)


:INPUT
cls
echo 1. 원격 데스크톱 포트(3389)를 변경합니다.
echo 2. 변경한 원격 데스크톱 포트를 지웁니다.
echo 3. 설정한 원격 데스크톱 목록을 확인합니다.
echo 4. 종료

set /p select=메뉴 선택(1,2,3,4) :
cls

if %select% == 1 ( 
set /p port=변경 할 포트 번호 입력 : 
) else if %select% == 2 ( 
set /p del_port=제거할 원격 데스크톱 포트 번호 입력 : 
) else if %select% == 3 ( 
netsh advfirewall firewall show rule name=all dir=in | findstr /C:"원격 데스크톱" 
) else if %select% == 4 ( exit ) else ( goto INPUT )

if %select% == 1 (

if "%port%" == "" (
goto INPUT
)

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d %port% /f

netsh advfirewall firewall add rule name="원격 데스크톱 %port%" description="3389포트 대신 %port%를 사용합니다." dir=in action=allow protocol=tcp localport=%port%
net stop /y TermService
net start /y TermService

echo 포트가 %port%로 변경되었습니다.
) else if %select% == 2 ( 

if "%del_port%" == "" (
goto INPUT
)
netsh advfirewall firewall delete rule name="원격 데스크톱 %del_port%" dir=in protocol=tcp localport=%del_port%
)

echo.
echo 계속하려면 Any 키를 누르세요.
pause > nul
goto INPUT