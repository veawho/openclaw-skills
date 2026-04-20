#!/usr/bin/env python3
"""
向量知识库 - 核心引擎
使用本地存储模拟向量数据库
"""
import os
import json
import hashlib
import re
from pathlib import Path

class VectorKnowledgeBase:
    def __init__(self, kb_path="/home/node/.openclaw/workspace/knowledge-base"):
        self.kb_path = Path(kb_path)
        self.docs_path = self.kb_path / "docs"
        self.vectors_path = self.kb_path / "vectors"
        
        self.docs_path.mkdir(parents=True, exist_ok=True)
        self.vectors_path.mkdir(parents=True, exist_ok=True)
        
        self.manifest_file = self.vectors_path / "manifest.json"
        self.index_file = self.vectors_path / "index.json"
        
        self.dimension = 1536  # 模拟 embedding 维度
        
    def load_manifest(self):
        """加载文档清单"""
        if self.manifest_file.exists():
            with open(self.manifest_file, "r") as f:
                return json.load(f)
        return {"documents": []}
    
    def save_manifest(self, manifest):
        """保存文档清单"""
        with open(self.manifest_file, "w") as f:
            json.dump(manifest, f, indent=2)
    
    def compute_mock_embedding(self, text):
        """模拟向量 - 实际使用真实 embedding API"""
        # 这里使用文本 hash 模拟向量
        h = hashlib.md5(text.encode()).digest()
        # 扩展到 1536 维
        vec = list(h * (1536 // len(h) + 1))[:1536]
        return vec
    
    def chunk_text(self, text, chunk_size=512, overlap=50):
        """分块文本"""
        chunks = []
        words = text.split()
        for i in range(0, len(words), chunk_size - overlap):
            chunk = " ".join(words[i:i + chunk_size])
            if chunk:
                chunks.append(chunk)
        return chunks
    
    def import_document(self, file_path):
        """导入文档"""
        path = Path(file_path)
        if not path.exists():
            return {"error": "文件不存在"}
        
        # 读取内容
        if path.suffix == ".md":
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()
        elif path.suffix == ".txt":
            with open(path, "r", encoding="utf-8") as f:
                content = f.read()
        else:
            return {"error": "不支持的格式"}
        
        # 分块
        chunks = self.chunk_text(content)
        
        # 计算向量
        vectors = []
        for i, chunk in enumerate(chunks):
            emb = self.compute_mock_embedding(chunk)
            doc_id = f"{path.stem}_{i}"
            vectors.append({
                "id": doc_id,
                "vector": emb,
                "metadata": {
                    "text": chunk[:200],
                    "source": str(path),
                    "chunk": i
                }
            })
        
        # 更新清单
        manifest = self.load_manifest()
        manifest["documents"].append({
            "path": str(path),
            "name": path.name,
            "chunks": len(chunks),
            "type": path.suffix
        })
        self.save_manifest(manifest)
        
        return {
            "success": True,
            "document": path.name,
            "chunks": len(chunks)
        }
    
    def search(self, query, top_k=5):
        """向量搜索"""
        query_emb = self.compute_mock_embedding(query)
        
        manifest = self.load_manifest()
        results = []
        
        # 模拟搜索 - 简单文本匹配
        for doc in manifest.get("documents", []):
            # 这里应该用向量相似度计算
            results.append({
                "document": doc["name"],
                "path": doc["path"],
                "similarity": 0.85,  # 模拟值
                "snippet": f"...{doc['name']}相关内容..."
            })
        
        return results[:top_k]
    
    def build_index(self):
        """构建索引"""
        index = {
            "name": "openclaw-vector-kb",
            "dimension": self.dimension,
            "doc_count": 0,
            "created": str(Path().cwd()),
            "status": "ready"
        }
        
        with open(self.index_file, "w") as f:
            json.dump(index, f, indent=2)
        
        manifest = self.load_manifest()
        index["doc_count"] = len(manifest.get("documents", []))
        
        return index


def main():
    import sys
    
    kb = VectorKnowledgeBase()
    
    if len(sys.argv) > 1:
        cmd = sys.argv[1]
        
        if cmd == "import":
            if len(sys.argv) > 2:
                result = kb.import_document(sys.argv[2])
                print(json.dumps(result, indent=2))
            else:
                print("用法: kb import <文件路径>")
        
        elif cmd == "search":
            if len(sys.argv) > 2:
                results = kb.search(sys.argv[2])
                print(json.dumps(results, indent=2))
            else:
                print("用法: kb search <查询内容>")
        
        elif cmd == "build":
            index = kb.build_index()
            print(json.dumps(index, indent=2))
        
        elif cmd == "status":
            manifest = kb.load_manifest()
            print(f"文档数: {len(manifest.get('documents', []))}")
        
        else:
            print(f"未知命令: {cmd}")
            print("可用命令: import, search, build, status")
    else:
        print("向量知识库系统")
        print("用法: kb <命令> [参数]")


if __name__ == "__main__":
    main()