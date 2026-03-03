from pypdf import PdfReader
import os

files = ['slides-default.pdf', 'slides-with-clicks.pdf']
for f in files:
    r = PdfReader(f)
    size = os.path.getsize(f) / 1024
    print(f"{f}: {len(r.pages)} pages, {size:.0f}KB")

r1 = PdfReader('slides-default.pdf')
r2 = PdfReader('slides-with-clicks.pdf')
print(f"\nPage difference: +{len(r2.pages) - len(r1.pages)} pages")
