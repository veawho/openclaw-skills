#!/bin/bash
cd /home/node/.openclaw/workspace/knowledge-base

echo "📚 导入配置文件和记忆文件到向量知识库..."
echo ""

# 导入配置文件
echo "1. 导入 OpenClaw 配置文档..."
python3 kb.py import docs/openclaw-config.md

echo ""
echo "2. 导入会话记忆..."
python3 kb.py import docs/session-memory.md

echo ""
echo "3. 导入 Workspace 文件说明..."
python3 kb.py import docs/workspace-files.md

echo ""
echo "4. 查看状态..."
python3 kb.py status

echo ""
echo "✅ 导入完成!"
ls -la docs/