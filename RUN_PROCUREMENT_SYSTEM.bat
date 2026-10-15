@echo off
title Umrah Hotels Procurement & Coverage Operations
cd /d "%~dp0"
echo ===============================================================================
echo   Umrah Hotels Procurement & Coverage System (Makkah & Madinah)
echo   Live OTA Scraper, Pricing Margins, Neighborhoods & Contract Workspace
echo ===============================================================================
echo.
python -m streamlit run ui/app.py --browser.gatherUsageStats false
pause
