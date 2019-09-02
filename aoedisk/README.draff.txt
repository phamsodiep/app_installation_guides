# app_installation_guides
## Setup development enviroment

## Build driver
1. git clone this repository
2. Download source code from github (import\cmds\0_import.bat)
3. Build (cd aoedisk-code && make && sign)

## Install driver
Need: bin folder & ContosoTest.cer
1. Enable Test mode for self signing (Enter ContosoTest.cer to install it to ROOT Certificate)
2. Turn on test mode: bcdedit /set TESTSIGNING ON
3. Restart for certification effection
4. Install driver from device manager (SCSCI class)

## Remove water mark
1. mkdir /media/sda1
2. mount /dev/sda1 /media/sda1
3. cd /media/sda1/Windows/System32/en-US
4. $PATH_TO_AOEDISK_FOLDER/hidewatermark.py
5. Optional (Verify what the script hidewatermark.py modified your user32.dll.mui library with your diff tools to make sure that there are no malwared add to user32.dll.mui.patch)
6. mv user32.dll.mui user32.dll.mui.bak
   mv user32.dll.mui.patch user32.dll.mui

## Test aoedisk scan && aoedisk mount

## Make it bootable
Objective: makesure the drivers are loaded as below order:
. ndis.sys
. NIC miniport driver (E1G6032E.sys or Rt64Win7.sys)
. aoedisk64.sys
. atapi.sys
. disk.sys
. CLASSPNP.SYS
. tcpip.sys
1. Optional => enable /sos booting (Windows NT 4.0 style) with msconfig.exe to see driver loading order

2. Regedit && navigate to [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services]
ndis.sys => untouched

NIC miniport driver (E1G6032E.sys or Rt64Win7.sys) => 
Start:=0
Group:=Cryptography

aoedisk64.sys driver => untouched

atapi.sys driver
Group:=Extended Base

disk.sys => untouched

CLASSPNP.SYS  => untouched

tcpip.sys driver
	Start:=1
	
Recommend Loader Order Group for atapi.sys
1. dsfroot.sys => 'Extended Base'
2. rdyboost.sys => 'PnP Filter'
3. mup.sys => 'Network'
4. No group (delete the key)

## Test boot from AoE disk
1. Server
apt-get install vblade
2. Client
Iso: https://boot.ipxe.org/ipxe.iso
Burn iso to cdrom, then boot from that cdrom