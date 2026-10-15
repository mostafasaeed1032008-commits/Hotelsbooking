"""
مدخل السيرفر السحابي لمنظومة فنادق الحرمين الشريفين
Streamlit Cloud Main Application Entry Point
"""
import sys
from pathlib import Path

# ربط المسار الجذري بالبيئة البرمجية
root_dir = Path(__file__).resolve().parent
if str(root_dir) not in sys.path:
    sys.path.insert(0, str(root_dir))

# تشغيل لوحة التحكم الرئيسية مباشرة
import ui.app
