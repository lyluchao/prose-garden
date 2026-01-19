#!/bin/bash

echo "🚀 开始部署散文花园到GitHub..."

# 设置Git配置
git config --global user.name "lyluchao"
git config --global user.email "您的邮箱@example.com"

# 清理并生成
echo "🔨 生成静态文件..."
hexo clean
hexo generate

# 部署到GitHub Pages
echo "🚀 部署到gh-pages分支..."
hexo deploy

# 提交源码到main分支
echo "💾 提交源码到main分支..."
git add .
git commit -m "更新散文花园: $(date '+%Y-%m-%d %H:%M:%S')" || true
git push origin main || echo "跳过源码提交"

echo "✅ 部署完成！"
echo "🌐 访问地址：https://lyluchao.github.io/prose-garden/"
echo "📁 GitHub仓库：https://github.com/lyluchao/prose-garden"
