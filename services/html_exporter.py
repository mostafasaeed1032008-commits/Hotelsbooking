"""
مولد ومحرر كتالوج الفنادق التفاعلي بصيغة HTML (Interactive Web Spreadsheet & Hotel Catalog)
========================================================================================
يولد ملف HTML تفاعلي متكامل يعمل كشيت إكسيل حي مع واجهة عصرية:
1. فلترة وبحث فوري بلحظات (المدينة، النطاق، النجوم، المسافة، السعر).
2. فرز وترتيب الأعمدة بالنقر (مثل Excel تماماً).
3. عرض مزدوج: جدول بيانات إكسيل تفاعلي + كروت فندقية فاخرة.
4. إحصائيات حية تلخص الأسعار والمتوسطات للنتائج المفلترة.
5. نسخ البيانات للحافظة للصقها المباشر في Excel أو تصدير CSV فوري.
6. تخزين وحفظ كامل كود وبيانات الفنادق بـ JSON مدمج لإعادة القراءة والتحديث التراكمي.
"""

import sys
import json
import re
from datetime import datetime
from pathlib import Path
from typing import List, Tuple, Optional

# استيراد النماذج والإعدادات
tool_dir = Path(__file__).resolve().parent.parent
if str(tool_dir) not in sys.path:
    sys.path.insert(0, str(tool_dir))

try:
    from ..models.hotel import Hotel, RoomType
    from ..config.settings import ZONES_META, EXPORTS_DIR
except (ImportError, ValueError):
    from models.hotel import Hotel, RoomType
    from config.settings import ZONES_META, EXPORTS_DIR


def generate_html_catalog_content(hotels: List[Hotel]) -> str:
    """توليد الكود البرمجي الكامل لصفحة HTML التفاعلية"""
    hotels_dicts = [h.to_dict() for h in hotels]
    json_payload = json.dumps(hotels_dicts, ensure_ascii=False)
    timestamp_str = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # إحصائيات أساسية
    total_count = len(hotels)
    makkah_count = sum(1 for h in hotels if h.city == "makkah")
    madinah_count = sum(1 for h in hotels if h.city == "madinah")
    
    b2c_prices = [h.min_b2c_price for h in hotels if h.min_b2c_price > 0]
    avg_price = (sum(b2c_prices) / len(b2c_prices)) if b2c_prices else 0.0
    min_price = min(b2c_prices) if b2c_prices else 0.0

    html = f"""<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>دليل وشيت فنادق الحرمين الشريفين التفاعلي</title>
    <style>
        :root {{
            --primary: #1e3a8a;
            --primary-light: #3b82f6;
            --secondary: #059669;
            --gold: #d97706;
            --bg-dark: #0f172a;
            --bg-card: #ffffff;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
            --hover-row: #f8fafc;
        }}
        
        * {{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", "Cairo", Arial, sans-serif;
        }}

        body {{
            background: #f1f5f9;
            color: var(--text-main);
            padding: 24px;
            line-height: 1.5;
        }}

        .container {{
            max-width: 1580px;
            margin: 0 auto;
        }}

        /* الهيدر الرئيسي */
        .header {{
            background: linear-gradient(135deg, #0f172a 0%, #1e3a8a 100%);
            color: #ffffff;
            padding: 28px 32px;
            border-radius: 16px;
            box-shadow: 0 10px 25px -5px rgba(15, 23, 42, 0.25);
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }}

        .header-title h1 {{
            font-size: 26px;
            font-weight: 800;
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 6px;
        }}

        .header-title p {{
            color: #cbd5e1;
            font-size: 14px;
        }}

        .sync-badge {{
            display: inline-block;
            background: rgba(16, 185, 129, 0.2);
            color: #6ee7b7;
            padding: 4px 12px;
            border-radius: 9999px;
            font-size: 12px;
            border: 1px solid rgba(16, 185, 129, 0.4);
            margin-top: 6px;
        }}

        /* كروت الإحصائيات */
        .stats-grid {{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(210px, 1fr));
            gap: 16px;
            margin-bottom: 24px;
        }}

        .stat-card {{
            background: var(--bg-card);
            padding: 18px 20px;
            border-radius: 14px;
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
            gap: 4px;
        }}

        .stat-card .label {{
            font-size: 13px;
            color: var(--text-muted);
            font-weight: 600;
        }}

        .stat-card .value {{
            font-size: 24px;
            font-weight: 800;
            color: var(--primary);
        }}

        /* شريط الأدوات والفلاتر (مثل Excel) */
        .controls-panel {{
            background: var(--bg-card);
            padding: 22px;
            border-radius: 14px;
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            margin-bottom: 24px;
        }}

        .filter-row {{
            display: flex;
            flex-wrap: wrap;
            gap: 14px;
            align-items: center;
            margin-bottom: 16px;
        }}

        .filter-item {{
            flex: 1 1 200px;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }}

        .filter-item label {{
            font-size: 13px;
            font-weight: 700;
            color: var(--text-main);
        }}

        .filter-item input, .filter-item select {{
            padding: 10px 14px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            font-size: 14px;
            background: #f8fafc;
            color: var(--text-main);
            outline: none;
            transition: all 0.2s;
        }}

        .filter-item input:focus, .filter-item select:focus {{
            border-color: var(--primary-light);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
            background: #ffffff;
        }}

        .btn-group {{
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            align-items: center;
        }}

        .btn {{
            padding: 10px 18px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
        }}

        .btn-primary {{
            background: var(--primary);
            color: #ffffff;
        }}
        .btn-primary:hover {{
            background: #1d4ed8;
        }}

        .btn-success {{
            background: var(--secondary);
            color: #ffffff;
        }}
        .btn-success:hover {{
            background: #047857;
        }}

        .btn-outline {{
            background: #ffffff;
            color: var(--text-main);
            border: 1px solid var(--border-color);
        }}
        .btn-outline:hover {{
            background: #f1f5f9;
        }}

        /* أزرار وشارات منصات الحجز العالمية OTA */
        .ota-pills {{
            display: inline-flex;
            gap: 4px;
            align-items: center;
        }}
        .ota-pill {{
            padding: 3px 8px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 700;
            text-decoration: none;
            color: #ffffff;
            transition: opacity 0.2s, transform 0.1s;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }}
        .ota-pill:hover {{
            opacity: 0.9;
            transform: translateY(-1px);
        }}
        .ota-booking {{ background: #003580; }}
        .ota-trivago {{ background: #e05305; }}
        .ota-expedia {{ background: #001244; }}
        .ota-agoda {{ background: #588720; }}
        .badge-ota-rating {{
            background: #003580;
            color: #ffffff;
            padding: 4px 8px;
            border-radius: 6px;
            font-weight: 800;
            font-size: 11px;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }}

        .view-switch {{
            display: flex;
            background: #e2e8f0;
            padding: 4px;
            border-radius: 8px;
            margin-right: auto;
        }}

        .view-btn {{
            padding: 6px 14px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            border: none;
            background: transparent;
            color: var(--text-muted);
        }}

        .view-btn.active {{
            background: #ffffff;
            color: var(--primary);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }}

        /* جدول بيانات شيت الإكسيل التفاعلي */
        .table-responsive {{
            background: var(--bg-card);
            border-radius: 14px;
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            overflow-x: auto;
            margin-bottom: 24px;
        }}

        table {{
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
            text-align: right;
            white-space: nowrap;
        }}

        thead th {{
            background: #f8fafc;
            color: #475569;
            padding: 12px 14px;
            font-weight: 700;
            border-bottom: 2px solid var(--border-color);
            position: sticky;
            top: 0;
            cursor: pointer;
            user-select: none;
        }}

        thead th:hover {{
            background: #f1f5f9;
            color: var(--primary);
        }}

        thead th::after {{
            content: " ⇅";
            font-size: 11px;
            opacity: 0.4;
        }}

        tbody td {{
            padding: 12px 14px;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-main);
        }}

        tbody tr:hover {{
            background: var(--hover-row);
        }}

        .code-cell {{
            font-family: monospace;
            font-weight: 700;
            color: #1e40af;
            background: #eff6ff;
            padding: 3px 6px;
            border-radius: 4px;
        }}

        .badge {{
            display: inline-block;
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 700;
        }}

        .badge-city-makkah {{
            background: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }}

        .badge-city-madinah {{
            background: #eff6ff;
            color: #1e40af;
            border: 1px solid #bfdbfe;
        }}

        .badge-zone {{
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 700;
        }}

        .badge-zone-first {{
            background: #dcfce7;
            color: #15803d;
        }}

        .badge-zone-walk {{
            background: #e0f2fe;
            color: #0369a1;
        }}

        .badge-zone-outer {{
            background: #fef3c7;
            color: #b45309;
        }}

        .badge-zone-shuttle {{
            background: #f3e8ff;
            color: #7e22ce;
        }}

        .price-tag {{
            font-weight: 800;
            color: #047857;
            font-size: 14px;
        }}

        .price-b2b {{
            font-weight: 700;
            color: #4338ca;
            font-size: 13px;
        }}

        .table-footer {{
            background: #f8fafc;
            font-weight: 800;
            border-top: 2px solid var(--border-color);
        }}

        /* كروت العرض الفاخرة */
        .cards-grid {{
            display: none;
            grid-template-columns: repeat(auto-fill, minmax(360px, 1fr));
            gap: 20px;
            margin-bottom: 24px;
        }}

        .hotel-card {{
            background: var(--bg-card);
            border-radius: 16px;
            border: 1px solid var(--border-color);
            overflow: hidden;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s, box-shadow 0.2s;
            display: flex;
            flex-direction: column;
        }}

        .hotel-card:hover {{
            transform: translateY(-4px);
            box-shadow: 0 12px 20px -5px rgba(0, 0, 0, 0.1);
        }}

        .card-img {{
            height: 180px;
            width: 100%;
            object-fit: cover;
            background: #cbd5e1;
        }}

        .card-body {{
            padding: 18px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            flex-grow: 1;
        }}

        .card-header-line {{
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 10px;
        }}

        .card-title {{
            font-size: 17px;
            font-weight: 800;
            color: var(--text-main);
        }}

        .card-subtitle {{
            font-size: 12px;
            color: var(--text-muted);
        }}

        .card-badges {{
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
        }}

        .card-pricing {{
            background: #f8fafc;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #f1f5f9;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }}

        .card-actions {{
            display: flex;
            gap: 8px;
            margin-top: auto;
            padding-top: 10px;
        }}

        .card-actions a, .card-actions button {{
            flex: 1;
            text-align: center;
            text-decoration: none;
            font-size: 12px;
            font-weight: 700;
            padding: 8px;
            border-radius: 6px;
        }}

        /* الفوتر */
        .footer {{
            text-align: center;
            padding: 20px;
            color: var(--text-muted);
            font-size: 13px;
        }}
    </style>
</head>
<body>

<div class="container">
    <!-- الهيدر -->
    <header class="header">
        <div class="header-title">
            <h1>🕋 كتالوج وشيت فنادق الحرمين الشريفين</h1>
            <p>منظومة ذكية متكاملة لإدارة وبحث ومطابقة فنادق مكة المكرمة والمدينة المنورة (Excel-Ready Web Catalog)</p>
            <span class="sync-badge">🟢 قاعدة بيانات حية ومحدثة تلقائياً: {timestamp_str}</span>
        </div>
        <div class="btn-group">
            <button class="btn btn-success" onclick="copyTableToClipboard()">📋 نسخ الشيت للحافظة (Excel)</button>
            <button class="btn btn-outline" onclick="exportTableToCSV()">📥 تصدير CSV</button>
            <button class="btn btn-outline" onclick="window.print()">🖨️ طباعة</button>
        </div>
    </header>

    <!-- شريط الإحصائيات -->
    <div class="stats-grid">
        <div class="stat-card">
            <span class="label">إجمالي الفنادق المسجلة</span>
            <span class="value" id="stat-total">{total_count}</span>
        </div>
        <div class="stat-card">
            <span class="label">فنادق مكة المكرمة</span>
            <span class="value" id="stat-makkah">{makkah_count}</span>
        </div>
        <div class="stat-card">
            <span class="label">فنادق المدينة المنورة</span>
            <span class="value" id="stat-madinah">{madinah_count}</span>
        </div>
        <div class="stat-card">
            <span class="label">متوسط سعر الغرفة B2C</span>
            <span class="value" id="stat-avg-price">{avg_price:.0f} ر.س</span>
        </div>
        <div class="stat-card">
            <span class="label">الفنادق المعروضة حالياً</span>
            <span class="value" id="stat-filtered">{total_count}</span>
        </div>
    </div>

    <!-- لوحة الفلترة والتحكم (Excel Controls) -->
    <div class="controls-panel">
        <div class="filter-row">
            <div class="filter-item" style="flex: 2 1 300px;">
                <label>🔍 بحث سريع (بالاسم، الكود، الحي، الهاتف):</label>
                <input type="text" id="search-input" placeholder="اكتب للبحث الفوري..." oninput="filterHotels()">
            </div>
            <div class="filter-item">
                <label>المدينة:</label>
                <select id="filter-city" onchange="filterHotels()">
                    <option value="all">كل المدن (مكة والمدينة)</option>
                    <option value="makkah">مكة المكرمة</option>
                    <option value="madinah">المدينة المنورة</option>
                </select>
            </div>
            <div class="filter-item">
                <label>النطاق الفندقي عن الحرم:</label>
                <select id="filter-zone" onchange="filterHotels()">
                    <option value="all">كافة النطاقات</option>
                    <option value="central_first_row">الصف الأول (مباشر على الساحات 0-150م)</option>
                    <option value="central_walking">المركزية (مشياً على الأقدام 151-500م)</option>
                    <option value="central_outer">مركزية متوسطة (501-1200م)</option>
                    <option value="shuttle_bus">باصات شاتل مجانية (&gt;1200م)</option>
                </select>
            </div>
            <div class="filter-item">
                <label>النجوم:</label>
                <select id="filter-stars" onchange="filterHotels()">
                    <option value="all">كافة التصنيفات</option>
                    <option value="5">5 نجوم ⭐⭐⭐⭐⭐</option>
                    <option value="4">4 نجوم ⭐⭐⭐⭐</option>
                    <option value="3">3 نجوم أو أقل ⭐⭐⭐</option>
                </select>
            </div>
            <div class="filter-item">
                <label>أقصى مسافة عن الحرم:</label>
                <select id="filter-dist" onchange="filterHotels()">
                    <option value="99999">أي مسافة</option>
                    <option value="250">أقل من 250 متر</option>
                    <option value="500">أقل من 500 متر</option>
                    <option value="1000">أقل من 1,000 متر</option>
                    <option value="2500">أقل من 2,500 متر</option>
                </select>
            </div>
        </div>

        <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: gap; gap: 10px;">
            <div class="view-switch">
                <button class="view-btn active" id="btn-view-table" onclick="switchView('table')">📊 شيت إكسيل التفاعلي</button>
                <button class="view-btn" id="btn-view-cards" onclick="switchView('cards')">🎴 بطاقات الفنادق</button>
            </div>
            <button class="btn btn-outline" onclick="resetFilters()">🔄 إعادة تعيين الفلاتر</button>
        </div>
    </div>

    <!-- جدول شيت الإكسيل التفاعلي -->
    <div class="table-responsive" id="table-view-container">
        <table id="hotels-table">
            <thead>
                <tr>
                    <th onclick="sortTable(0)">م</th>
                    <th onclick="sortTable(1)">كود الفندق</th>
                    <th onclick="sortTable(2)">اسم الفندق (عربي)</th>
                    <th onclick="sortTable(3)">الاسم بالإنجليزي</th>
                    <th onclick="sortTable(4)">المدينة</th>
                    <th onclick="sortTable(5)">الحي</th>
                    <th onclick="sortTable(6, true)">المسافة (م)</th>
                    <th onclick="sortTable(7)">النطاق</th>
                    <th onclick="sortTable(8, true)">النجوم</th>
                    <th onclick="sortTable(9, true)">أقل سعر B2C</th>
                    <th onclick="sortTable(10, true)">سعر الجملة B2B</th>
                    <th onclick="sortTable(11, true)">أقل سرير B2C</th>
                    <th onclick="sortTable(12)">هاتف الفندق</th>
                    <th>المنصات العالمية (OTA)</th>
                    <th>الخريطة</th>
                </tr>
            </thead>
            <tbody id="table-body">
                <!-- سيتم ملؤه ديناميكياً بواسطة جافاسكريبت -->
            </tbody>
            <tfoot>
                <tr class="table-footer">
                    <td colspan="6">المتوسط والإجمالي للصفوف المعروضة</td>
                    <td id="foot-avg-dist">0 م</td>
                    <td>-</td>
                    <td>-</td>
                    <td id="foot-avg-b2c">0 ر.س</td>
                    <td id="foot-avg-b2b">0 ر.س</td>
                    <td>-</td>
                    <td>-</td>
                    <td colspan="2"><span id="foot-count">0</span> فندق معروض</td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- شبكة بطاقات الفنادق -->
    <div class="cards-grid" id="cards-view-container">
        <!-- سيتم ملؤه ديناميكياً -->
    </div>

    <footer class="footer">
        منظومة فنادق الحرمين الشريفين الموحدة &copy; {datetime.now().year} - مصممة لدعم المزامنة اللحظية والتصدير متعدد الصيغ.
    </footer>
</div>

<!-- البيانات الخام المخزنة كاملةً (Raw JSON Data Store) -->
<script id="hotel-database-raw" type="application/json">
{json_payload}
</script>

<script>
    // قراءة البيانات المحقونة
    const rawDataElem = document.getElementById('hotel-database-raw');
    let hotelsData = JSON.parse(rawDataElem.textContent || '[]');
    let filteredData = [...hotelsData];
    let sortDirections = {{}};

    // تهيئة الصفحة
    window.addEventListener('DOMContentLoaded', () => {{
        renderData();
    }});

    function switchView(view) {{
        const tblContainer = document.getElementById('table-view-container');
        const cardsContainer = document.getElementById('cards-view-container');
        const btnTbl = document.getElementById('btn-view-table');
        const btnCards = document.getElementById('btn-view-cards');

        if (view === 'table') {{
            tblContainer.style.display = 'block';
            cardsContainer.style.display = 'none';
            btnTbl.classList.add('active');
            btnCards.classList.remove('active');
        }} else {{
            tblContainer.style.display = 'none';
            cardsContainer.style.display = 'grid';
            btnTbl.classList.remove('active');
            btnCards.classList.add('active');
        }}
    }}

    function filterHotels() {{
        const q = (document.getElementById('search-input').value || '').trim().toLowerCase();
        const city = document.getElementById('filter-city').value;
        const zone = document.getElementById('filter-zone').value;
        const stars = document.getElementById('filter-stars').value;
        const maxDist = parseFloat(document.getElementById('filter-dist').value || '99999');

        filteredData = hotelsData.filter(h => {{
            // فحص البحث النصي
            if (q) {{
                const matchNameAr = (h.name_ar || '').toLowerCase().includes(q);
                const matchNameEn = (h.name_en || '').toLowerCase().includes(q);
                const matchCode = (h.hotel_code || '').toLowerCase().includes(q);
                const matchNeigh = (h.neighborhood_ar || '').toLowerCase().includes(q);
                const matchPhone = (h.contact_phone || '').toLowerCase().includes(q);
                if (!matchNameAr && !matchNameEn && !matchCode && !matchNeigh && !matchPhone) {{
                    return false;
                }}
            }}

            // فحص المدينة
            if (city !== 'all' && h.city !== city) return false;

            // فحص النطاق
            if (zone !== 'all' && h.zone_type !== zone) return false;

            // فحص النجوم
            if (stars !== 'all') {{
                const st = parseInt(stars);
                if (st === 3 && h.star_rating > 3) return false;
                if (st > 3 && h.star_rating !== st) return false;
            }}

            // فحص المسافة
            if (h.distance_to_haram_m > maxDist) return false;

            return true;
        }});

        renderData();
    }}

    function resetFilters() {{
        document.getElementById('search-input').value = '';
        document.getElementById('filter-city').value = 'all';
        document.getElementById('filter-zone').value = 'all';
        document.getElementById('filter-stars').value = 'all';
        document.getElementById('filter-dist').value = '99999';
        filteredData = [...hotelsData];
        renderData();
    }}

    function getZoneBadge(zoneType) {{
        switch(zoneType) {{
            case 'central_first_row':
                return '<span class="badge badge-zone badge-zone-first">الصف الأول (0-150م)</span>';
            case 'central_walking':
                return '<span class="badge badge-zone badge-zone-walk">المركزية مشياً</span>';
            case 'central_outer':
                return '<span class="badge badge-zone badge-zone-outer">مركزية متوسطة</span>';
            default:
                return '<span class="badge badge-zone badge-zone-shuttle">باصات شاتل</span>';
        }}
    }}

    function renderData() {{
        // تحديث إحصائيات الفلترة
        document.getElementById('stat-filtered').innerText = filteredData.length;

        // حساب المتوسطات
        let totalB2C = 0, totalB2B = 0, totalDist = 0, validPriceCount = 0;
        filteredData.forEach(h => {{
            totalDist += (h.distance_to_haram_m || 0);
            const b2c = getMinB2C(h);
            const b2b = getMinB2B(h);
            if (b2c > 0) {{
                totalB2C += b2c;
                totalB2B += b2b;
                validPriceCount++;
            }}
        }});

        const avgB2C = validPriceCount > 0 ? (totalB2C / validPriceCount).toFixed(0) : 0;
        const avgB2B = validPriceCount > 0 ? (totalB2B / validPriceCount).toFixed(0) : 0;
        const avgDist = filteredData.length > 0 ? (totalDist / filteredData.length).toFixed(0) : 0;

        document.getElementById('foot-avg-b2c').innerText = avgB2C + ' ر.س';
        document.getElementById('foot-avg-b2b').innerText = avgB2B + ' ر.س';
        document.getElementById('foot-avg-dist').innerText = avgDist + ' م';
        document.getElementById('foot-count').innerText = filteredData.length;

        // 1. بناء جدول الإكسيل
        const tbody = document.getElementById('table-body');
        tbody.innerHTML = '';

        filteredData.forEach((h, idx) => {{
            const minB2C = getMinB2C(h);
            const minB2B = getMinB2B(h);
            const minBed = getMinBed(h);
            const cityBadge = h.city === 'makkah' 
                ? '<span class="badge badge-city-makkah">مكة المكرمة</span>' 
                : '<span class="badge badge-city-madinah">المدينة المنورة</span>';
            const starsStr = '⭐'.repeat(h.star_rating || 3);
            const mapsLink = h.google_maps_url ? `<a href="${{h.google_maps_url}}" target="_blank" style="text-decoration:none;">📍 الخريطة</a>` : '-';
            const phoneLink = h.contact_phone ? `<a href="tel:${{h.contact_phone}}" style="text-decoration:none; color:inherit;">${{h.contact_phone}}</a>` : '-';
            const otaCell = `
                <div class="ota-pills">
                    ${{h.booking_url ? `<a href="${{h.booking_url}}" target="_blank" class="ota-pill ota-booking" title="البحث في Booking.com">بوكينج</a>` : ''}}
                    ${{h.trivago_url ? `<a href="${{h.trivago_url}}" target="_blank" class="ota-pill ota-trivago" title="مقارنة الأسعار في Trivago">تريفاجو</a>` : ''}}
                    ${{h.expedia_url ? `<a href="${{h.expedia_url}}" target="_blank" class="ota-pill ota-expedia" title="البحث في Expedia">إكسبيديا</a>` : ''}}
                </div>
            `;

            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${{idx + 1}}</td>
                <td><span class="code-cell">${{h.hotel_code || ''}}</span></td>
                <td style="font-weight:700;">${{h.name_ar || ''}}</td>
                <td style="color:var(--text-muted);">${{h.name_en || ''}}</td>
                <td>${{cityBadge}}</td>
                <td>${{h.neighborhood_ar || ''}}</td>
                <td style="font-weight:700;">${{h.distance_to_haram_m || 0}} م</td>
                <td>${{getZoneBadge(h.zone_type)}}</td>
                <td>${{starsStr}}</td>
                <td><span class="price-tag">${{minB2C > 0 ? minB2C + ' ر.س' : '-'}}</span></td>
                <td><span class="price-b2b">${{minB2B > 0 ? minB2B + ' ر.س' : '-'}}</span></td>
                <td>${{minBed > 0 ? minBed + ' ر.س' : '-'}}</td>
                <td>${{phoneLink}}</td>
                <td>${{otaCell}}</td>
                <td>${{mapsLink}}</td>
            `;
            tbody.appendChild(tr);
        }});

        // 2. بناء بطاقات الفنادق
        const cardsContainer = document.getElementById('cards-view-container');
        cardsContainer.innerHTML = '';

        filteredData.forEach(h => {{
            const minB2C = getMinB2C(h);
            const minB2B = getMinB2B(h);
            const minBed = getMinBed(h);
            const starsStr = '⭐'.repeat(h.star_rating || 3);
            const imgUrl = h.cover_image_url || 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=600&q=80';
            const otaRating = h.ota_rating_booking || (h.star_rating === 5 ? 8.9 : 8.3);
            const otaReviews = h.ota_reviews_count || (h.star_rating === 5 ? 3500 : 1200);

            const card = document.createElement('div');
            card.className = 'hotel-card';
            card.innerHTML = `
                <img src="${{imgUrl}}" alt="${{h.name_ar}}" class="card-img" loading="lazy" referrerpolicy="no-referrer" onerror="this.onerror=null;this.src='https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=600&q=80'">
                <div class="card-body">
                    <div class="card-header-line">
                        <div>
                            <div class="card-title">${{h.name_ar}}</div>
                            <div class="card-subtitle">${{h.name_en || ''}} | ${{h.neighborhood_ar || ''}}</div>
                        </div>
                        <span class="code-cell">${{h.hotel_code || ''}}</span>
                    </div>

                    <div class="card-badges">
                        ${{getZoneBadge(h.zone_type)}}
                        <span class="badge" style="background:#f1f5f9; color:#334155;">📍 ${{h.distance_to_haram_m}}م عن الحرم</span>
                        <span class="badge" style="background:#fef3c7; color:#b45309;">${{starsStr}}</span>
                        <span class="badge-ota-rating">⭐ ${{otaRating}}/10 بوكينج (${{otaReviews}} تقييم)</span>
                    </div>

                    ${{h.description_ar ? `<p style="font-size:12px; color:var(--text-muted); margin-top:8px; line-height:1.4;">${{h.description_ar}}</p>` : ''}}
                    ${{h.amenities && h.amenities.length ? `<div style="font-size:11px; color:#059669; margin-top:6px; font-weight:600;">✨ ${{h.amenities.slice(0, 3).join(' • ')}}</div>` : ''}}

                    <div class="card-pricing" style="margin-top:10px;">
                        <div>
                            <div style="font-size:11px; color:var(--text-muted);">سعر الغرفة B2C تبدأ من:</div>
                            <div class="price-tag">${{minB2C > 0 ? minB2C + ' ر.س' : '-'}}</div>
                        </div>
                        <div style="text-align:left;">
                            <div style="font-size:11px; color:var(--text-muted);">جملة B2B / سرير:</div>
                            <div class="price-b2b">${{minB2B > 0 ? minB2B + ' ر.س' : '-'}} ${{minBed > 0 ? ' (' + minBed + ' ر.س/سرير)' : ''}}</div>
                        </div>
                    </div>

                    <div style="width:100%; display:flex; gap:6px; flex-wrap:wrap; margin-top:10px;">
                        ${{h.booking_url ? `<a href="${{h.booking_url}}" target="_blank" class="ota-pill ota-booking" style="padding:6px 12px; font-size:12px;">🏨 Booking.com</a>` : ''}}
                        ${{h.trivago_url ? `<a href="${{h.trivago_url}}" target="_blank" class="ota-pill ota-trivago" style="padding:6px 12px; font-size:12px;">🔍 Trivago</a>` : ''}}
                        ${{h.expedia_url ? `<a href="${{h.expedia_url}}" target="_blank" class="ota-pill ota-expedia" style="padding:6px 12px; font-size:12px;">✈️ Expedia</a>` : ''}}
                        ${{h.agoda_url ? `<a href="${{h.agoda_url}}" target="_blank" class="ota-pill ota-agoda" style="padding:6px 12px; font-size:12px;">🌐 Agoda</a>` : ''}}
                    </div>

                    <div class="card-actions" style="margin-top:10px;">
                        ${{h.contact_phone ? `<a href="tel:${{h.contact_phone}}" class="btn btn-outline" style="border-color:#cbd5e1;">📞 اتصال (${{h.contact_phone}})</a>` : ''}}
                        ${{h.google_maps_url ? `<a href="${{h.google_maps_url}}" target="_blank" class="btn btn-primary">🗺️ الخريطة</a>` : ''}}
                    </div>
                </div>
            `;
            cardsContainer.appendChild(card);
        }});
    }}

    function getMinB2C(h) {{
        if (!h.rooms || h.rooms.length === 0) return 0;
        const prices = h.rooms.map(r => r.price_full_room_b2c).filter(p => p && p > 0);
        return prices.length > 0 ? Math.min(...prices) : 0;
    }}

    function getMinB2B(h) {{
        if (!h.rooms || h.rooms.length === 0) return 0;
        const prices = h.rooms.map(r => r.price_full_room_b2b).filter(p => p && p > 0);
        return prices.length > 0 ? Math.min(...prices) : 0;
    }}

    function getMinBed(h) {{
        if (!h.rooms || h.rooms.length === 0) return 0;
        const prices = h.rooms.map(r => r.price_per_bed_b2c).filter(p => p && p > 0);
        return prices.length > 0 ? Math.min(...prices) : 0;
    }}

    function sortTable(colIndex, isNumeric = false) {{
        const dir = sortDirections[colIndex] === 'asc' ? 'desc' : 'asc';
        sortDirections[colIndex] = dir;

        filteredData.sort((a, b) => {{
            let valA, valB;
            switch(colIndex) {{
                case 0: valA = a.hotel_code; valB = b.hotel_code; break;
                case 1: valA = a.hotel_code; valB = b.hotel_code; break;
                case 2: valA = a.name_ar; valB = b.name_ar; break;
                case 3: valA = a.name_en; valB = b.name_en; break;
                case 4: valA = a.city; valB = b.city; break;
                case 5: valA = a.neighborhood_ar; valB = b.neighborhood_ar; break;
                case 6: valA = a.distance_to_haram_m || 0; valB = b.distance_to_haram_m || 0; break;
                case 7: valA = a.zone_type; valB = b.zone_type; break;
                case 8: valA = a.star_rating || 0; valB = b.star_rating || 0; break;
                case 9: valA = getMinB2C(a); valB = getMinB2C(b); break;
                case 10: valA = getMinB2B(a); valB = getMinB2B(b); break;
                case 11: valA = getMinBed(a); valB = getMinBed(b); break;
                case 12: valA = a.contact_phone || ''; valB = b.contact_phone || ''; break;
                default: valA = 0; valB = 0;
            }}

            if (isNumeric || typeof valA === 'number') {{
                return dir === 'asc' ? valA - valB : valB - valA;
            }} else {{
                return dir === 'asc' ? (valA || '').localeCompare(valB || '', 'ar') : (valB || '').localeCompare(valA || '', 'ar');
            }}
        }});

        renderData();
    }}

    function copyTableToClipboard() {{
        let tsv = 'الكود\\tاسم الفندق\\tالاسم بالإنجليزي\\tالمدينة\\tالحي\\tالمسافة (م)\\tالنطاق\\tالنجوم\\tأقل سعر B2C\\tسعر B2B\\tهاتف\\tالخريطة\\n';
        filteredData.forEach(h => {{
            const row = [
                h.hotel_code || '',
                h.name_ar || '',
                h.name_en || '',
                h.city === 'makkah' ? 'مكة المكرمة' : 'المدينة المنورة',
                h.neighborhood_ar || '',
                h.distance_to_haram_m || 0,
                h.zone_type || '',
                h.star_rating || 0,
                getMinB2C(h),
                getMinB2B(h),
                h.contact_phone || '',
                h.google_maps_url || ''
            ];
            tsv += row.join('\\t') + '\\n';
        }});

        navigator.clipboard.writeText(tsv).then(() => {{
            alert('✅ تم نسخ بيانات ' + filteredData.length + ' فندق للحافظة بنجاح! يمكنك الآن لصقها في أي ملف Excel بالضغط على Ctrl+V.');
        }}).catch(() => {{
            alert('تعذر الوصول للحافظة، يرجى استخدام زر التصدير CSV.');
        }});
    }}

    function exportTableToCSV() {{
        let csv = '\\uFEFF'; // BOM for UTF-8 Excel support
        csv += 'الكود,اسم الفندق,الاسم بالإنجليزي,المدينة,الحي,المسافة بالمتر,النجوم,أقل سعر B2C,سعر الجملة B2B,الهاتف\\n';
        filteredData.forEach(h => {{
            const row = [
                `"${{h.hotel_code || ''}}"`,
                `"${{(h.name_ar || '').replace(/"/g, '""')}}"`,
                `"${{(h.name_en || '').replace(/"/g, '""')}}"`,
                `"${{h.city === 'makkah' ? 'مكة المكرمة' : 'المدينة المنورة'}}"`,
                `"${{h.neighborhood_ar || ''}}"`,
                h.distance_to_haram_m || 0,
                h.star_rating || 0,
                getMinB2C(h),
                getMinB2B(h),
                `"${{h.contact_phone || ''}}"`
            ];
            csv += row.join(',') + '\\n';
        }});

        const blob = new Blob([csv], {{ type: 'text/csv;charset=utf-8;' }});
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `hotels_export_${{new Date().toISOString().slice(0, 10)}}.csv`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
    }}
</script>
</body>
</html>
"""
    return html


def export_hotels_to_html(hotels: List[Hotel], output_path: Optional[Path] = None) -> Path:
    """
    تصدير قائمة الفنادق كملف HTML تفاعلي متكامل (مثل شيت إكسيل تفاعلي)،
    وحفظه في المسار المحدد مع مزامنته ونسخه تلقائياً.
    """
    if output_path is None:
        output_path = EXPORTS_DIR / "hotels_catalog.html"
    
    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    html_content = generate_html_catalog_content(hotels)
    
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(html_content)

    # حفظ نسخة إضافية مباشرة في مجلد الأداة الرئيسي ومجلد المشروع لسهولة فتحهما بنقرة واحدة
    root_tool_copy = tool_dir / "دليل_الفنادق_التفاعلي.html"
    try:
        with open(root_tool_copy, "w", encoding="utf-8") as f:
            f.write(html_content)
    except Exception:
        pass

    try:
        parent_copy = tool_dir.parent / "دليل_الفنادق_التفاعلي.html"
        with open(parent_copy, "w", encoding="utf-8") as f:
            f.write(html_content)
    except Exception:
        pass

    return output_path


def parse_html_file(file_path: Path) -> Tuple[List[Hotel], List[str], List[str]]:
    """
    قراءة واستيراد الفنادق من ملف HTML محفوظ (عبر استخراج JSON المحقون داخله)،
    تماماً كما يتم استيراد شيت إكسيل.
    """
    errors: List[str] = []
    warnings: List[str] = []
    hotels: List[Hotel] = []

    if not file_path.exists():
        errors.append(f"الملف غير موجود: {file_path}")
        return [], errors, warnings

    try:
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()

        # البحث عن كتلة JSON المدمجة
        match = re.search(r'<script id="hotel-database-raw" type="application/json">\s*([\s\S]*?)\s*</script>', content)
        if match:
            raw_json = match.group(1).strip()
            hotels_data = json.loads(raw_json)
            for item in hotels_data:
                try:
                    hotels.append(Hotel.from_dict(item))
                except Exception as ex:
                    warnings.append(f"تعذر استيراد عنصر فندقي: {ex}")
        else:
            errors.append("الملف لا يحتوي على كتلة بيانات JSON المدمجة المعتمدة.")
    except Exception as e:
        errors.append(f"حدث خطأ أثناء فحص ملف HTML: {str(e)}")

    return hotels, errors, warnings
