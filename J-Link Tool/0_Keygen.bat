@echo off
set ROOT=%~dp0
cd /d %ROOT%
cls

JLinkTool.exe --keygen --pause
