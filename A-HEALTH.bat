@ECHO OFF
mode con: cols=120 lines=39
color 0B
CLS
:MENU
ECHO.
ECHO.      ############################################################################################
ECHO.    ##                                                                                         #####
ECHO.   ##                                                                                $$$        #####
ECHO.   ##        $$$         $     $$  $$$$$      $$$     $      $$$$$$$ $     $$       $   $       #####
ECHO.   ##       $  $$        $     $$ $    $$    $  $$    $         $    $     $$    $$$$   $$$$    #####
ECHO.   ##      $    $$   $$$ $$$$$$$$ $$$$$$$   $    $$   $         $    $$$$$$$$   $           $   #####
ECHO.   ##     $$$$$$$$$      $     $$ $        $$$$$$$$$  $         $    $     $$    $$$$   $$$$    #####
ECHO.   ##    $        $$     $     $$  $$$$$  $        $$ $$$$$$$   $    $     $$       $   $       #####
ECHO.   ##                                                                                $$$        #####
ECHO.    ##                                                                                         #####
ECHO.      ############################################################################################
ECHO.
ECHO ATOMIC HEALTH PLUS (A-HEALTH +) is a utility for diagnosing and repairing damaged image files and Windows system files.
ECHO It is absolutely safe to run in the Windows environment because it uses built-in Microsoft functions.
ECHO.
ECHO Remember to run as Administrator.
ECHO.
ECHO The Deployment Image Servicing and Management (DISM) command tool includes multiple features that can help to repair a system image, including "CheckHealth," "ScanHealth," and "RestoreHealth," and you must to use them in that order.
ECHO You can also execute the "AUTO" command.
ECHO !WARNING! This will initiate all three scripts to run one by one. This will take longer.
ECHO And you can try to run the System File Checker command tool to repair the currupt setup of your Windows.
ECHO.
ECHO. --------------------------------------------
ECHO Please select one of the menu options below:
ECHO. --------------------------------------------
ECHO.
ECHO 1 - Check Health
ECHO 2 - Scan Health
ECHO 3 - Restore Health
ECHO 4 - AUTO
ECHO 5 - System File Checker
ECHO 0 - Quit
ECHO.
set /p choice=Enter your choice: 
if "%choice%"=="1" goto check_health
if "%choice%"=="2" goto scan_health
if "%choice%"=="3" goto restore_health
if "%choice%"=="4" goto auto
if "%choice%"=="5" goto sfc
if /I "%choice%"=="0" goto end
GOTO MENU

:check_health
ECHO Checking the health of your system image...
DISM /Online /Cleanup-Image /CheckHealth
PAUSE
GOTO MENU

:scan_health
ECHO Scanning the health of your system image...
DISM /Online /Cleanup-Image /ScanHealth
PAUSE
GOTO MENU

:restore_health
ECHO Restoring the health of your system image...
DISM /Online /Cleanup-Image /RestoreHealth
PAUSE
GOTO MENU

:auto
ECHO Warning! A full system image scan and recovery has been initiated. This process is safe and will not affect user files and applications. But it can be quite time-consuming...
ECHO Stage 1: Checking the health of your system image...
DISM /Online /Cleanup-Image /CheckHealth
ECHO Stage 2: Scanning the health of your system image...
DISM /Online /Cleanup-Image /ScanHealth
ECHO Stage 3: Restoring the health of your system image...
DISM /Online /Cleanup-Image /RestoreHealth
PAUSE
GOTO MENU

:sfc
ECHO Scanning your current system setup...
SFC /scannow
PAUSE
GOTO MENU

:end
EXIT