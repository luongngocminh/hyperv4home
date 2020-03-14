# A Batch Script for installing Hyper-V and Containers in any Windows 10 Edition
This is a script that I had written to install and enable these 2 features on any Windows Edition so you won't have to install a bunch of stuffs just to install Docker.

# Usage
1. Download the file batch file in this repository or create your own with this content:
```
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
for /F "tokens=*" %%A in (hyper.txt) do (
    %prefix%%%A^"
)
echo N | dism /online /enable-feature /featurename:Containers -All /LimitAccess /ALL

pause
```
2. Run the ```.bat``` file with Administrator.
3. There will be 2 prompts asking you to restart the computer, just press N so it won't restart, you can restart manually after the installation is completed.

# (Optional) For Installing Docker Desktop
To install Docker Desktop, you have to do some tinkering in Windows Registry.
1. Run ```regedit```.
2. Go to ```HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion``` and find the Edition ID value. Set its value data to ```Professional```. 

Now you can install Docker Desktop on your Windows 10 Home Single Language Edition without hickups
