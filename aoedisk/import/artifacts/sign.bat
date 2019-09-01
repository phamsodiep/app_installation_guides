@echo off
echo Signing...

call config.bat

if not exist ContosoTest.cer %ddkdir%\bin\amd64\makecert -r -pe -ss PrivateCertStore -n CN=Contoso.com(Test) -eku 1.3.6.1.5.5.7.3.3 ContosoTest.cer

echo Create cat file...
%ddkdir%\bin\selfsign\inf2cat.exe /driver:bin /os:Vista_x86

echo Signing drivers in bin folder...
%ddkdir%\bin\amd64\SignTool.exe  sign /a /v /fd sha256 /s PrivateCertStore /n Contoso.com(Test) /t http://timestamp.verisign.com/scripts/timstamp.dll bin\*.cat 
echo.
echo.
echo ****************************************************************
echo * WARNING                                                      *
echo * =======                                                      *
echo * Please keep file ContosoTest.cer private. Revealing/sharing  *
echo * this file results in your computer is un-secure and easy be  *
echo * hacked if it installs the file for aoedsk64.sys/aoedsk32.sys *
echo * driver installation.                                         *
echo ****************************************************************
echo.