#!/bin/bash
cd /home/node/.openclaw/workspace/knowledge-base

echo "📚 最终导入..."
python3 kb.py import docs/skills-optimization.md
python3 kb.py build
python3 kb.py status

echo ""
echo "📊 最终统计:"
echo "   文档总数: $(ls docs/*.md 2>/dev/null | wc -l)"
echo ""
cat vectors/manifest.json 2>/dev/null | python3 -c "
import json, sys
data = json.load(sys.stdin)
print('   文档列表:')
for doc in data.get('documents', []):
    print('   -', doc.get('name'))
"