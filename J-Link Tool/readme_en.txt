JLinkTool by UniSoft v1.00
Only for J-Link V10, and J-Link V11!

JLinkTool.exe <command> [<arguments>] [<flags>]

[commands]

--test                              : Just a Blinky test of exploit, 
                                    :   use it first to test if exploit working with your firmware
                                    :   LEDs of J-Link will blink around 30 seconds.

--keygen                            : Generate and display Licenses... 

--eraseots 0                        : Erases features
--eraseots 1                        : Erases features and OEM stamp (use it to get rid of EDU)
--eraseots 2                        : Erases features and set OEM to "SEGGER-EDU"
--eraseots 4                        : Erases features and adds default features "FlashBP" and "GDB"
--eraseots 7                        : makes EDU

--eraselicenses                     : erases installable licenses from config and from registry: 
                                    :   HKEY_CURRENT_USER\Software\SEGGER\License_xxx
                                    :   doesn't erase OTS


--setoem SEGGER-EDU                 : set OEM stamp

--addlic  JFlash                    : add built-in license (to OTS)
--addlic #JFlash                    : generate and add built-in license (to CONFIG)
--addlic @JFlash                    : generate and add installable license (registry)

--dump  <addr>  <size> <file>       : dump firmware 
--dump 1A000000 80000 file1.bin     : 
--dump 1B000000 80000 file2.bin     : LPC4337 used in clone have 2 banks 
 
--dumponce                          : just a flag; dump only if files is not exists

--pause                             : display "Press any key..." 


Example:
JLinkTool.exe --eraseots 5 --dumponce --dump 1A000000 80000 ROM_1A000000_80000_V{V}_SN{S}.bkp --addlic @FlashDL --addlic @JFlash --addlic @RDI --pause
makes backup dump to the file: ROM_1A000000_80000_V10_SN12345678.bkp (if file is not exisrs)
erases OEM and features, adds features "FlashBP" and "GDB",
adds licenses FlashDL, JFlash, RDI to registry.
and wait "Press any key..." 

======[ some information ]=====================================================================

OTS is a memory, some kind of software implemented OTP.
Bits can be cleared to 0 and cannot be set.
As well it doesnt have a function to Erase page.
For V10 and V11 OTS is a one page 512 bytes
in a second half stored the certificate (signed serial number and unique id of mcu),
thet is why serial number cannot be changed, as well as a write the dump to another MCU. 

CONFIG is a Read/Write memory, and used for settings... 

licenses (aka features) can be stored in a few places
  1. Built-in licenses stored inside OTS memory and cannot be deleted!
  2. In the registry: HKEY_CURRENT_USER\Software\SEGGER\License_xxx
  3. Inside config memory of J-Link (but it looks that it is not working anymore).
     JFlash doesn't see it.
  
There are only 5 licenses: "FlashBP", "GDB", "FlashDL", "JFlash", "RDI"
any other string (case sensitive) will make J-Link defective!
For J-Link V10 and V11 with Serial Numbers:
26xxxxxxx, 5xxxxxxx, 82xxxxxxx, 
built-in features "JFlash" and "RDI" not allowed!

OEM stamp can be one of:
"IAR", "IARKS", "SEGGERKS", "DIGI-LINK", "J-Link-CE", "MIDAS", "ADI", "SAM-ICE", "SEGGER-EDU"

===============================================================================================
Best regards, UNIS  
iarkgen@gmail.com
08.08.2022



