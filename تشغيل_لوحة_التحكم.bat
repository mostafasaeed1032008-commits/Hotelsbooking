@echo off
title Umrah Hotels Dashboard
cd /d "%~dp0"
echo ========================================================
echo   Launching Umrah Hotels Management Dashboard...
echo ========================================================
python -m streamlit run ui/app.py --browser.gatherUsageStats false
pause
