@echo off
title Umrah Hotel Web Inspector
cd /d "%~dp0"
echo Running Deep Web Hotel Inspection & Auto-Collection...
python services/web_hotel_inspector.py
pause
