#!/bin/bash
# Watchdog - 看门狗监控脚本

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🐕 Watchdog - 看门狗监控"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

interval=10
max_retries=5
restart_count=0

log() {
    echo "[$(date '+%H:%M:%S')] $*"
}

# 检查 OpenClaw 进程
check_process() {
    if pgrep -f "openclaw" > /dev/null; then
        echo "✅ OpenClaw 进程: 运行中"
        return 0
    else
        echo "❌ OpenClaw 进程: 未运行"
        return 1
    fi
}

# 检查端口
check_port() {
    if netstat -tuln 2>/dev/null | grep -q ":18789"; then
        echo "✅ Gateway 端口: 18789 正常"
        return 0
    else
        echo "❌ Gateway 端口: 无法访问"
        return 1
    fi
}

# 检查延迟
check_latency() {
    start=$(date +%s%3N)
    curl -s --connect-timeout 2 "http://localhost:18789" > /dev/null 2>&1
    end=$(date +%s%3N)
    latency=$((end - start))
    
    if [ "$latency" -lt 1000 ]; then
        echo "✅ 响应延迟: ${latency}ms (正常)"
        return 0
    else
        echo "⚠️ 响应延迟: ${latency}ms (过高)"
        return 1
    fi
}

# 主循环
echo ""
echo "🕐 启动看门狗监控 (间隔: ${interval}s)"

while true; do
    echo ""
    log "=== 检查周期 ==="
    
    ok=true
    
    check_process || ok=false
    check_port || ok=false
    check_latency || ok=false
    
    if $ok; then
        echo "✅ 所有检查通过"
    else
        echo "⚠️ 检测到异常"
        restart_count=$((restart_count + 1))
        
        if [ "$restart_count" -ge "$max_retries" ]; then
            echo "🚨 连续失败 ${restart_count} 次，需要人工干预"
            break
        else
            echo "🔄 尝试恢复 (第 $restart_count/$max_retries 次)"
        fi
    fi
    
    sleep "$interval"
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⚠️ 看门狗需要人工干预"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"