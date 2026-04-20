#!/bin/bash
cd /home/node/.openclaw/workspace/knowledge-base
python3 kb.py import docs/skills-catalog.md
python3 kb.py status