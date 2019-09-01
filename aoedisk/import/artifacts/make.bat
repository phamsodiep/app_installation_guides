@echo off
mkdir bin 2>nul
cmd /c 0_makeutils0
cmd /c 0_makeutils1
rem cmd /c 1_makedriver c 32
cmd /c 1_makedriver c 64
copy ..\import\artifacts\aoedsk.inf bin