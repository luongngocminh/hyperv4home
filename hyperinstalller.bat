:: Hyper-V installation
@echo off
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum>hyper.txt
set "prefix=dism /online /norestart /add-package:^"%SystemRoot%\servicing\Packages\"
for /F "tokens=*" %%A in (hyper.txt) do (
    %prefix%%%A^"
)
echo N | dism /online /enable-feature /featurename:Microsoft-Hyper-V -All /LimitAccess /ALL
:: Containers installation
dir /b %SystemRoot%\servicing\Packages\*containers*.mum>containers.txt
for /F "tokens=*" %%A in (containers.txt) do (
    %prefix%%%A^"
)
echo N | dism /online /enable-feature /featurename:Containers -All /LimitAccess /ALL

pause
