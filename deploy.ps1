# Git 部署脚本 - CADD Slides (PowerShell)
Write-Host "========================================"
Write-Host "Git 部署脚本 - CADD Slides"
Write-Host "========================================"
Write-Host ""

Set-Location $PSScriptRoot

Write-Host "[1/8] 初始化 Git 仓库..."
git init
if ($LASTEXITCODE -ne 0) {
    Write-Host "错误：Git 初始化失败" -ForegroundColor Red
    Read-Host "按任意键退出"
    exit 1
}

Write-Host "[2/8] 配置用户信息..."
git config user.name "MayWood051"
git config user.email "maywood051@gmail.com"

Write-Host "[3/8] 添加项目配置文件..."
git add .gitignore .npmrc package.json README.md
git commit -m "chore: initialize Slidev project"

Write-Host "[4/8] 添加核心演示文稿..."
git add slides.md
git commit -m "feat: add CADD course slides with rich content and visual design"

Write-Host "[5/8] 添加导出的 PDF 文件..."
git add slides-default.pdf slides-with-clicks.pdf
git commit -m "docs: add exported PDF presentations"

Write-Host "[6/8] 添加部署配置和辅助文件..."
git add netlify.toml vercel.json components pages snippets
git commit -m "chore: add deployment configs and support files"

Write-Host "[7/8] 添加质量报告..."
git add *.md *.txt 2>$null
if ($LASTEXITCODE -eq 0) {
    git commit -m "docs: add quality assessment reports"
}

Write-Host "[8/8] 推送到 GitHub..."
git branch -M main
git remote add origin https://github.com/MayWood051/CADD-slides.git
git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "推送失败，可能是因为远程仓库已存在内容。" -ForegroundColor Yellow
    Write-Host "尝试强制推送..." -ForegroundColor Yellow
    git push -u origin main --force-with-lease
}

Write-Host ""
Write-Host "========================================"
Write-Host "部署完成！" -ForegroundColor Green
Write-Host "仓库地址: https://github.com/MayWood051/CADD-slides"
Write-Host "========================================"
Read-Host "按任意键退出"
