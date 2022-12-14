@echo off
set ROOT=%~dp0
cd /d %ROOT%
cls

JLinkTool.exe --eraseots 5 --dumponce --dump 1A000000 80000 ROM_1A000000_80000_V{V}_SN{S}.bkp --addlic @FlashDL --addlic @JFlash --addlic @RDI --pause
