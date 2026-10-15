@echo off
title Umrah Hotels Interactive HTML Catalog
cd /d "%~dp0"
echo Opening Interactive HTML Hotels Catalog in your browser...
if exist "دليل_الفنادق_التفاعلي.html" (
    start "" "دليل_الفنادق_التفاعلي.html"
) else (
    start "" "data\exports\hotels_catalog.html"
)
