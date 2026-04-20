#!/bin/bash
# OpenClaw 系统优化脚本

set -e

KB_PATH="/home/node/.openclaw/workspace/knowledge-base"
SKILLS_DIR="/home/node/.openclaw/workspace/skills"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔧 OpenClaw 系统优化"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# 1. 系统检查
echo ""
echo "[1/5] 📊 系统状态检查..."

total_skills=$(ls -d "$SKILLS_DIR"/*/ 2>/dev/null | wc -l)
enabled_skills=$(ls "$SKILLS_DIR"/*/SKILL.md 2>/dev/null | wc -l)
disabled_mac=$(ls "$SKILLS_DIR"/*/*.macOS 2>/dev/null | wc -l)
disabled_other=$(ls "$SKILLS_DIR"/*/*.disabled 2>/dev/null | wc -l)

echo "   Skills 总数: $total_skills"
echo "   启用: $enabled_skills"
echo "   禁用 (macOS): $disabled_mac"
echo "   禁用 (其他): $disabled_other"

# 2. 知识库检查
echo ""
echo "[2/5] 📚 知识库检查..."
if [ -f "$KB_PATH/kb.py" ]; then
    doc_count=$(python3 "$KB_PATH/kb.py" status 2>/dev/null | grep "文档数" | awk '{print $2}')
    echo "   文档数: $doc_count"
else
    echo "   ⚠️ 知识库未初始化"
fi

# 3. Git 状态
echo ""
echo "[3/5] 📦 Git 仓库状态..."
cd /home/node/.openclaw/workspace
untracked=$(git status --short 2>/dev/null | grep "^??" | wc -l)
echo "   未跟踪文件: $untracked"

# 4. 配置文件验证
echo ""
echo "[4/5] ⚙️ 配置文件验证..."
if [ -f /home/node/.openclaw/openclaw.json ]; then
    echo "   ✅ openclaw.json 存在"
    subagent_max=$(grep -o '"maxConcurrent":[0-9]*' /home/node/.openclaw/openclaw.json | cut -d: -f2)
    echo "   ✅ Subagent 并发: $subagent_max"
else
    echo "   ❌ openclaw.json 缺失"
fi

# 5. 优化建议
echo ""
echo "[5/5] 💡 优化建议..."

# 计算启用率
total=$((enabled_skills + disabled_mac + disabled_other))
if [ $total -gt 0 ]; then
    enable_rate=$((enabled_skills * 100 / total))
    echo "   Skills 启用率: $enable_rate%"
fi

if [ "$untracked" -gt 10 ]; then
    echo "   ⚠️ 未跟踪文件过多，建议提交"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ 检查完成"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo ""
echo "📋 快速命令:"
echo "   查看 Skills: ls $SKILLS_DIR"
echo "   查看知识库: python3 $KB_PATH/kb.py status"
echo "   查看配置: cat /home/node/.openclaw/openclaw.json | python3 -m json.tool"
echo ""