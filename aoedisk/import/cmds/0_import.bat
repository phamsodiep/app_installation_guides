@echo off
echo Import/clone source code from git.code.sf.net
git clone --depth=1 https://git.code.sf.net/p/aoedisk/code aoedisk-code
copy import\artifacts\0_makeutils0.bat aoedisk-code  > NUL
copy import\artifacts\0_makeutils1.bat aoedisk-code  > NUL
copy import\artifacts\1_makedriver.bat aoedisk-code  > NUL
copy /y import\artifacts\config.bat aoedisk-code     > NUL
copy import\artifacts\make.bat aoedisk-code          > NUL
copy import\artifacts\sign.bat aoedisk-code          > NUL
