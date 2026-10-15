@echo off
chcp 65001 >nul
title رفع المنظومة إلى GitHub للديبلوي السحابي
cd /d "%~dp0"
echo ===============================================================================
echo   🕋 تجهيز ورفع منظومة فنادق الحرمين إلى GitHub
echo   للربط مع Streamlit Community Cloud
echo ===============================================================================
echo.
echo يرجى إنشاء مستودع جديد (New Repository) فارغ على حسابك في GitHub (مثلاً: makkah-hotels)
echo ثم الصق رابط المستودع هنا (مثال: https://github.com/username/makkah-hotels.git)
echo.
set /p REPO_URL="رابط مستودع GitHub: "

if "%REPO_URL%"=="" (
    echo لم يتم إدخال رابط! تم إلغاء العملية.
    pause
    exit /b
)

echo.
echo [1/3] فحص وإعداد الفرع الرئيسي (main)...
git branch -M main

echo [2/3] ربط المستودع البعيد (Remote Origin)...
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo [3/3] رفع الكود إلى GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ===============================================================================
    echo   ✅ تم رفع المشروع بنجاح إلى GitHub!
    echo   الآن يمكنك الضغط على زر "Deploy now" في المتصفح وسيتم إطلاق التطبيق فوراً!
    echo ===============================================================================
) else (
    echo.
    echo ❌ حدث خطأ أثناء الرفع، يرجى التأكد من صحة الرابط وتسجيل الدخول إلى Git.
)

pause
