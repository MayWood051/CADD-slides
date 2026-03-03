from pypdf import PdfReader
import os

files = {
    'slides-default.pdf': 'DEFAULT',
    'slides-with-clicks.pdf': 'WITH-CLICKS'
}

for filename, label in files.items():
    filepath = filename
    if os.path.exists(filepath):
        reader = PdfReader(filepath)
        print(f"\n{'='*70}")
        print(f"📊 {label}: {filename}")
        print(f"{'='*70}")
        print(f"总页数: {len(reader.pages)}")
        
        # 提取前10页的文本摘要
        print(f"\n📋 内容摘要 (前10页):")
        for i in range(min(10, len(reader.pages))):
            page = reader.pages[i]
            text = page.extract_text()
            if text:
                lines = [l.strip() for l in text.split('\n') if l.strip()][:2]
                content = ' | '.join(lines)[:60]
                print(f"  页 {i+1:2d}: {content}")
    else:
        print(f"❌ 文件不存在: {filepath}")
