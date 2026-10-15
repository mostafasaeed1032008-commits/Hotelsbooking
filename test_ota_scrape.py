import httpx
import re
import json

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36',
    'Accept-Language': 'ar,en;q=0.9',
}

def test_booking_autocomplete(query):
    url = f"https://accommodations.booking.com/autocomplete.json?query={query}&language=ar"
    try:
        with httpx.Client(timeout=10.0, follow_redirects=True) as client:
            resp = client.get(url, headers=headers)
            print("Booking Autocomplete Status:", resp.status_code)
            if resp.status_code == 200:
                print("Data:", resp.text[:300])
    except Exception as e:
        print("Booking Autocomplete Error:", e)

import urllib.parse

def test_ddg_otas(hotel_name):
    query = f"{hotel_name} Makkah hotel"
    url = f"https://html.duckduckgo.com/html/?q={query}"
    try:
        with httpx.Client(timeout=10.0, follow_redirects=True) as client:
            resp = client.get(url, headers=headers)
            print("DDG Status:", resp.status_code)
            uddg_links = re.findall(r'uddg=([^&"\']+)', resp.text)
            decoded_links = [urllib.parse.unquote(l) for l in uddg_links]
            print(f"Total decoded links: {len(decoded_links)}")
            
            booking = [l for l in decoded_links if "booking.com" in l]
            return booking
    except Exception as e:
        print("DDG Error:", e)
        return []

def test_tripadvisor():
    # Test TripAdvisor search / hotel page
    url = "https://www.tripadvisor.com/Search?q=Swissotel+Makkah"
    try:
        with httpx.Client(timeout=10.0, follow_redirects=True) as client:
            resp = client.get(url, headers={'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'})
            print("TripAdvisor status:", resp.status_code, "Length:", len(resp.text))
            photos = re.findall(r'https://media-cdn\.tripadvisor\.com/[^\s"\'<>]+\.(?:jpg|jpeg)', resp.text)
            print("Tripadvisor photos:", len(set(photos)), list(set(photos))[:3])
    except Exception as e:
        print("Tripadvisor error:", e)

def test_ddg_snippets(hotel_name):
    query = f"{hotel_name} Makkah hotel booking trivago expedia"
    url = f"https://html.duckduckgo.com/html/?q={urllib.parse.quote(query)}"
    try:
        with httpx.Client(timeout=10.0, follow_redirects=True) as client:
            resp = client.get(url, headers=headers)
            print("DDG Status:", resp.status_code)
            
            # Find result blocks
            # <a class="result__url" ...>
            # <a class="result__snippet" ...>
            snippets = re.findall(r'<a[^>]+class="result__snippet"[^>]*>(.*?)</a>', resp.text, re.DOTALL)
            titles = re.findall(r'<a[^>]+class="result__title"[^>]*>(.*?)</a>', resp.text, re.DOTALL)
            uddg_links = re.findall(r'uddg=([^&"\']+)', resp.text)
            decoded_links = [urllib.parse.unquote(l) for l in uddg_links]
            
            clean_titles = [re.sub(r'<[^>]+>', '', t).strip() for t in titles]
            clean_snips = [re.sub(r'<[^>]+>', '', s).strip() for s in snippets]
            
            print(f"Found {len(clean_titles)} results:")
            for i in range(min(5, len(clean_titles))):
                link = decoded_links[i] if i < len(decoded_links) else ""
                print(f"[{i+1}] {clean_titles[i]}")
                print(f"    URL: {link}")
                if i < len(clean_snips):
                    print(f"    Snippet: {clean_snips[i][:120]}...")
    except Exception as e:
        print("DDG Error:", e)

if __name__ == "__main__":
    test_ddg_snippets("Swissotel Makkah")


