@echo off
title Umrah Hotel Web Inspector
cd /d "%~dp0"
echo ========================================================
echo   Running Deep Web Hotel Inspection & Auto-Collection...
echo   جاري تنفيذ الفحص العميق واستخراج الفنادق من الويب...
echo ========================================================
python services/web_hotel_inspector.py
pause
