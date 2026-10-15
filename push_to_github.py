"""
أداة رفع منظومة فنادق الحرمين إلى GitHub تمهيداً للديبلوي السحابي
===================================================================
واجهة رسومية بسيطة وسريعة لتفادي مشاكل ترميز سطر الأوامر في ويندوز.
"""

import sys
import os
import subprocess
import webbrowser
from pathlib import Path

# التأكد من المسار الحالي
project_dir = Path(__file__).resolve().parent
os.chdir(project_dir)

def run_git_push(repo_url: str, log_callback=None):
    """تنفيذ أوامر الربط والرفع إلى GitHub"""
    if not repo_url or not repo_url.strip():
        if log_callback:
            log_callback("❌ يرجى إدخال رابط مستودع GitHub أولاً!")
        return False

    repo_url = repo_url.strip()
    
    # تصحيح الروابط في حال تم نسخ رابط الصفحة بدلاً من .git
    if repo_url.startswith("https://github.com/") and not repo_url.endswith(".git"):
        repo_url = repo_url + ".git"

    def log(msg):
        if log_callback:
            log_callback(msg)
        else:
            print(msg)

    try:
        log("⏳ [1/4] إعداد الفرع الرئيسي (main)...")
        subprocess.run(["git", "branch", "-M", "main"], check=True, cwd=project_dir)

        log("⏳ [2/4] ربط المستودع البعيد (Remote Origin)...")
        subprocess.run(["git", "remote", "remove", "origin"], stderr=subprocess.DEVNULL, cwd=project_dir)
        subprocess.run(["git", "remote", "add", "origin", repo_url], check=True, cwd=project_dir)

        log("🚀 [3/4] جاري رفع الكود إلى GitHub (يرجى الانتظار ثوانٍ)...")
        # تشغيل الدفع
        res = subprocess.run(
            ["git", "push", "-u", "origin", "main", "--force"],
            capture_output=True,
            text=True,
            cwd=project_dir
        )

        if res.returncode == 0:
            log("🎉 [4/4] تم رفع المشروع بنجاح 100% إلى GitHub!")
            log("\n========================================================")
            log("✅ مبروك! الكود الآن متاح على GitHub.")
            log("👉 ارجع لشاشة المتصفح واضغط على زر 'Deploy now' الأحمر.")
            log("========================================================")
            return True
        else:
            err_msg = res.stderr or res.stdout
            log(f"⚠️ تفاصيل عملية الرفع:\n{err_msg}")
            if "Permission to" in err_msg or "Authentication failed" in err_msg or "fatal:" in err_msg:
                log("\n💡 إذا طُلب منك تسجيل الدخول، يرجى الموافقة في نافذة المتصفح التي ستفتح من Git.")
            return False

    except Exception as e:
        log(f"❌ حدث خطأ غير متوقع: {str(e)}")
        return False


def launch_gui():
    """تشغيل الواجهة الرسومية البسيطة"""
    try:
        import tkinter as tk
        from tkinter import messagebox, ttk
    except ImportError:
        launch_cli()
        return

    root = tk.Tk()
    root.title("🕋 رافع منظومة فنادق الحرمين إلى GitHub (لخدمة Streamlit Cloud)")
    root.geometry("640x520")
    root.minsize(580, 480)
    root.configure(bg="#f8fafc")

    # الخطوط والتنسيق
    font_main = ("Segoe UI", 10)
    font_bold = ("Segoe UI", 10, "bold")
    font_title = ("Segoe UI", 13, "bold")

    # رأس النافذة
    header_frame = tk.Frame(root, bg="#0f172a", pady=15)
    header_frame.pack(fill="x")

    lbl_title = tk.Label(
        header_frame,
        text="🕋 تجهيز ورفع المنظومة إلى GitHub للديبلوي السحابي",
        fg="#ffffff",
        bg="#0f172a",
        font=font_title
    )
    lbl_title.pack()

    lbl_sub = tk.Label(
        header_frame,
        text="خطوة واحدة فقط لإطلاق التطبيق أونلاين على Streamlit Community Cloud",
        fg="#94a3b8",
        bg="#0f172a",
        font=("Segoe UI", 9)
    )
    lbl_sub.pack(pady=(4, 0))

    # المحتوى الداخلي
    content_frame = tk.Frame(root, bg="#f8fafc", padx=20, pady=15)
    content_frame.pack(fill="both", expand=True)

    # زر فتح صفحة إنشاء المستودع
    step1_frame = tk.Frame(content_frame, bg="#ffffff", bd=1, relief="solid", padx=15, pady=10)
    step1_frame.pack(fill="x", pady=(0, 12))

    lbl_step1 = tk.Label(
        step1_frame,
        text="1️⃣ أنشئ مستودعاً فارغاً جديداً على حسابك في GitHub (إذا لم تكن قد أنشأته بعد):",
        bg="#ffffff",
        font=font_bold,
        anchor="e",
        justify="right"
    )
    lbl_step1.pack(anchor="e")

    def open_github():
        webbrowser.open("https://github.com/new")

    btn_open = tk.Button(
        step1_frame,
        text="🌐 اضغط هنا لفتح صفحة إنشاء مستودع جديد على GitHub",
        bg="#0284c7",
        fg="#ffffff",
        font=font_bold,
        padx=12,
        pady=5,
        cursor="hand2",
        command=open_github,
        relief="flat"
    )
    btn_open.pack(pady=(6, 0))

    # خانة إدخال الرابط
    step2_frame = tk.Frame(content_frame, bg="#ffffff", bd=1, relief="solid", padx=15, pady=10)
    step2_frame.pack(fill="x", pady=(0, 12))

    lbl_step2 = tk.Label(
        step2_frame,
        text="2️⃣ الصق رابط المستودع هنا (URL):",
        bg="#ffffff",
        font=font_bold,
        anchor="e"
    )
    lbl_step2.pack(anchor="e")

    input_box_frame = tk.Frame(step2_frame, bg="#ffffff")
    input_box_frame.pack(fill="x", pady=(6, 4))

    entry_url = tk.Entry(input_box_frame, font=("Segoe UI", 11), relief="solid", bd=1)
    entry_url.pack(side="left", fill="x", expand=True, ipady=4, padx=(0, 8))

    def paste_clipboard():
        try:
            entry_url.delete(0, tk.END)
            entry_url.insert(0, root.clipboard_get().strip())
        except Exception:
            pass

    btn_paste = tk.Button(
        input_box_frame,
        text="📋 لصق من الحافظة",
        bg="#e2e8f0",
        fg="#0f172a",
        font=font_main,
        padx=10,
        pady=3,
        relief="flat",
        cursor="hand2",
        command=paste_clipboard
    )
    btn_paste.pack(side="right")

    # زر الرفع
    def on_click_push():
        url = entry_url.get().strip()
        if not url:
            messagebox.showwarning("تنبيه", "يرجى لصق رابط مستودع GitHub أولاً!")
            return

        btn_push.config(state="disabled", text="⏳ جاري الرفع الآن...")
        txt_log.delete("1.0", tk.END)
        root.update()

        def append_log(text):
            txt_log.insert(tk.END, text + "\n")
            txt_log.see(tk.END)
            root.update()

        success = run_git_push(url, append_log)
        btn_push.config(state="normal", text="🚀 رفع المشروع إلى GitHub الآن")

        if success:
            messagebox.showinfo(
                "نجاح العملية 🎉",
                "تم رفع الكود بالكامل إلى GitHub بنجاح!\n\nيمكنك الآن العودة لشاشة المتصفح والضغط على زر 'Deploy now'."
            )

    btn_push = tk.Button(
        content_frame,
        text="🚀 3️⃣ رفع المشروع إلى GitHub الآن",
        bg="#10b981",
        fg="#ffffff",
        font=("Segoe UI", 11, "bold"),
        pady=8,
        cursor="hand2",
        command=on_click_push,
        relief="flat"
    )
    btn_push.pack(fill="x", pady=(0, 10))

    # صندوق المخرجات والسجلات
    lbl_log = tk.Label(content_frame, text="سجل العمليات:", bg="#f8fafc", font=("Segoe UI", 9, "bold"), anchor="e")
    lbl_log.pack(anchor="e")

    txt_log = tk.Text(content_frame, height=8, bg="#1e293b", fg="#38bdf8", font=("Consolas", 9), relief="solid", bd=1)
    txt_log.pack(fill="both", expand=True)
    txt_log.insert(tk.END, "جاهز لرفع المشروع... الصق رابط مستودع GitHub ثم اضغط على زر الرفع الأخضر.\n")

    root.mainloop()


def launch_cli():
    """تشغيل سطر الأوامر البديل في حال تعذر تشغيل الواجهة الرسومية"""
    print("=" * 65)
    print("  رفع منظومة فنادق الحرمين إلى GitHub (لخدمة Streamlit Cloud)")
    print("=" * 65)
    print("1. افتح الرابط: https://github.com/new وأنشئ مستودعاً فارغاً.")
    repo = input("2. الصق رابط المستودع هنا: ").strip()
    if repo:
        run_git_push(repo)
    input("\nاضغط Enter للخروج...")


if __name__ == "__main__":
    launch_gui()
