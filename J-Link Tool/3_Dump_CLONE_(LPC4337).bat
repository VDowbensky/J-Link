@echo off
set ROOT=%~dp0
cd /d %ROOT%
cls

JLinkTool.exe --dump 1A000000 80000 ROM_1A000000_80000_V{V}_SN{S}.bin --dump 1B000000 80000 ROM_1B000000_80000_V{V}_SN{S}.bin --pause
