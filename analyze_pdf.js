import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// 简单的 PDF 页数提取
function getPDFPageCount(filePath) {
  const buffer = fs.readFileSync(filePath);
  const text = buffer.toString('latin1');
  
  // 查找 /Pages 对象中的 /Count
  const match = text.match(/\/Type\s*\/Pages[\s\S]*?\/Count\s+(\d+)/);
  if (match) {
    return parseInt(match[1]);
  }
  
  return 'unknown';
}

const files = ['slides-default.pdf', 'slides-with-clicks.pdf'];
const results = {};

files.forEach(f => {
  const fullPath = path.join(__dirname, f);
  const size = fs.statSync(fullPath).size / 1024;
  const pages = getPDFPageCount(fullPath);
  results[f] = { pages, size: size.toFixed(0) };
  console.log(`${f}: ${pages} pages, ${size.toFixed(0)}KB`);
});

const defaultPages = results['slides-default.pdf'].pages;
const clicksPages = results['slides-with-clicks.pdf'].pages;
console.log(`\nPage difference: +${clicksPages - defaultPages} pages`);
