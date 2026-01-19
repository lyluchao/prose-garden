#!/bin/bash

echo "开始推送散文花园项目..."

# 检查网络连接
echo "检查GitHub连接..."
ping -c 2 github.com > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ 无法连接GitHub，请检查网络"
    exit 1
fi

# 设置Git配置
git config --global user.name "lyluchao"
git config --global user.email "your-email@example.com"

# 添加所有文件
echo "添加文件到Git..."
git add .

# 提交更改
echo "提交更改..."
git commit -m "更新散文花园项目: $(date '+%Y-%m-%d %H:%M:%S')"

# 尝试推送（使用多个备选方法）
echo "尝试推送到GitHub..."

# 方法1：直接推送
if git push origin main; then
    echo "✅ 推送成功！"
    exit 0
fi

echo "尝试方法2：使用SSH..."

# 方法2：使用SSH
git remote set-url origin git@github.com:lyluchao/prose-garden.git
if git push origin main; then
    echo "✅ SSH推送成功！"
    exit 0
fi

echo "尝试方法3：使用HTTP/1.1..."

# 方法3：临时使用HTTP/1.1
git config --global http.version HTTP/1.1
if git push origin main; then
    echo "✅ HTTP/1.1推送成功！"
    # 恢复设置
    git config --global http.version HTTP/2
    exit 0
fi

echo "❌ 所有推送方法都失败了"
echo "请尝试手动推送："
echo "1. git push origin main"
echo "2. 或检查网络连接"
echo "3. 或稍后再试"

exit 1
