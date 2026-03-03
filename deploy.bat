@echo off
echo ========================================
echo Git 部署脚本 - CADD Slides
echo ========================================
echo.

cd /d "%~dp0"

echo [1/8] 初始化 Git 仓库...
git init
if errorlevel 1 (
    echo 错误：Git 初始化失败
    pause
    exit /b 1
)

echo [2/8] 配置用户信息...
git config user.name "MayWood051"
git config user.email "maywood051@gmail.com"

echo [3/8] 添加项目配置文件...
git add .gitignore .npmrc package.json README.md
git commit -m "chore: initialize Slidev project"

echo [4/8] 添加核心演示文稿...
git add slides.md
git commit -m "feat: add CADD course slides with rich content and visual design"

echo [5/8] 添加导出的 PDF 文件...
git add slides-default.pdf slides-with-clicks.pdf
git commit -m "docs: add exported PDF presentations"

echo [6/8] 添加部署配置和辅助文件...
git add netlify.toml vercel.json components pages snippets
git commit -m "chore: add deployment configs and support files"

echo [7/8] 添加质量报告...
git add *.md *.txt
git commit -m "docs: add quality assessment reports"

echo [8/8] 推送到 GitHub...
git branch -M main
git remote add origin https://github.com/MayWood051/CADD-slides.git
git push -u origin main

if errorlevel 1 (
    echo.
    echo 推送失败，可能是因为远程仓库已存在内容。
    echo 尝试强制推送...
    git push -u origin main --force-with-lease
)

echo.
echo ========================================
echo 部署完成！
echo 仓库地址: https://github.com/MayWood051/CADD-slides
echo ========================================
pause
