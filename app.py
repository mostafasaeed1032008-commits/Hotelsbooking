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

# قراءة وتنفيذ كود واجهة العمليات بالكامل في سياق التطبيق
app_file = root_dir / "ui" / "app.py"
with open(app_file, "r", encoding="utf-8") as f:
    code = f.read()

exec(compile(code, str(app_file), "exec"), globals())
