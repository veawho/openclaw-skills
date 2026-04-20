#!/bin/bash
# OpenClaw 系统监控脚本

set -e

CONFIG="/home/node/.openclaw/openclaw.json"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 OpenClaw 系统监控"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# 解析配置获取阈值
get_threshold() {
    local key="$1"
    grep -o "\"$key\":[0-9]*" "$CONFIG" | head -1 | cut -d: -f2
}

# CPU 检查
check_cpu() {
    local threshold=$(get_threshold "cpu")
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 2>/dev/null || echo "0")
    echo "CPU 使用率: ${cpu_usage}% (阈值: ${threshold}%)"
    if (( $(echo "$cpu_usage > $threshold" | bc -l 2>/dev/null || echo 0) )); then
        echo "   ⚠️  超过阈值!"
    else
        echo "   ✅ 正常"
    fi
}

# 内存检查
check_memory() {
    local threshold=$(get_threshold "memory")
    local mem_usage=$(free -m | awk '/Mem:/ {print $3}' 2>/dev/null || echo "0")
    local mem_total=$(free -m | awk '/Mem:/ {print $2}' 2>/dev/null || echo "1")
    local percent=$((mem_usage * 100 / mem_total))
    echo "内存使用: ${mem_usage}MB / ${mem_total}MB (${percent}%) (阈值: ${threshold}%)"
    if [ "$percent" -gt "$threshold" ]; then
        echo "   ⚠️  超过阈值!"
    else
        echo "   ✅ 正常"
    fi
}

# 延迟检查
check_latency() {
    local threshold=$(get_threshold "latency")
    echo "响应延迟: 检查中..."
    local start=$(date +%s%3N)
    curl -s --connect-timeout 1 "http://localhost:18789" > /dev/null 2>&1
    local end=$(date +%s%3N)
    local latency=$((end - start))
    echo "响应延迟: ${latency}ms (阈值: ${threshold}ms)"
    if [ "$latency" -gt "$threshold" ]; then
        echo "   ⚠️  超过阈值!"
    else
        echo "   ✅ 正常"
    fi
}

# 配置检查
check_config() {
    echo ""
    echo "⚙️  配置检查..."
    
    subagent_max=$(grep -o '"maxConcurrent":[0-9]*' "$CONFIG" | cut -d: -f2)
    echo "   Subagent 并发: $subagent_max"
    
    cache_enabled=$(grep -c '"cache"' "$CONFIG")
    echo "   缓存: $([ $cache_enabled -gt 0 ] && echo "启用" || echo "禁用")"
    
    lb_enabled=$(grep -c '"loadbalancer"' "$CONFIG")
    echo "   负载均衡: $([ $lb_enabled -gt 0 ] && echo "启用" || echo "禁用")"
    
    monitor_enabled=$(grep -c '"monitoring"' "$CONFIG")
    echo "   监控: $([ $monitor_enabled -gt 0 ] && echo "启用" || echo "禁用")"
}

# 主流程
echo ""
check_config

echo ""
echo "📈 性能指标:"

echo ""
check_cpu

echo ""
check_memory

echo ""
check_latency

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ 监控完成"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"