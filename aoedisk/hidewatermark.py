#!/usr/bin/python

import sys

TEST_MODE_STR = "\x54\x00\x65\x00\x73\x00\x74\x00\x20\x00\x4d\x00\x6f\x00\x64\x00\x65\x00"
TEST_MODE_HID = "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"

WIN_VER_STR   = "\x57\x00\x69\x00\x6E\x00\x64\x00\x6F\x00\x77\x00\x73\x00\x20\x00\x25\x00\x77\x00\x73\x00\x0D\x00\x25\x00\x77\x00\x73\x00\x20\x00\x42\x00\x75\x00\x69\x00\x6C\x00\x64\x00\x20\x00\x25\x00\x77\x00\x73\x00"
WIN_VER_HID   = "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"

if not (len(TEST_MODE_STR) == len(TEST_MODE_HID)):
	print "Input constants is invalid, please review constants TEST_MODE_STR, TEST_MODE_HID."
	sys.exit()
if not (len(TEST_MODE_STR) == len(TEST_MODE_HID)):
	print "Input constants is invalid, please review constants WIN_VER_STR, WIN_VER_HID."
	sys.exit()

display_dll_file = open("user32.dll.mui", "r")
display_dll_file_patch = open("user32.dll.mui.patch", "w")




display_dll_bin = display_dll_file.read()

display_dll_bin = display_dll_bin.replace(TEST_MODE_STR, TEST_MODE_HID, 1)
display_dll_bin = display_dll_bin.replace(WIN_VER_STR, WIN_VER_HID, 1)

display_dll_file_patch.write(display_dll_bin)

display_dll_file.close()
display_dll_file_patch.close()

print "Patching is done!. The output file is user32.dll.mui.patch"
