@echo off
cd /d "%~dp0"

pixi install
pixi run jupyter

pause