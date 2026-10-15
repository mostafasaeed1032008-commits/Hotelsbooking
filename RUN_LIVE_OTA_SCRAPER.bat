@echo off
chcp 65001 > nul
title Multi-OTA Live Hotel Web Scraper
cd /d "%~dp0"
echo ====================================================================
echo   Live Multi-OTA Web Scraper (Booking.com, Agoda, Expedia, Trivago)
echo   كشط وسحب فنادق مكة والمدينة الحقيقية بالصور والتقييمات
echo ====================================================================
python run_ota_scraper.py
pause
