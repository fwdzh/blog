#!/bin/bash
# push.sh
# 自动提交并推送 Git 仓库，可选自定义 commit message + 时间戳

# 读取第一个参数作为 msg，如果没输入就空
msg="$1"

# 获取当前时间
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# 生成 commit message
if [ -z "$msg" ]; then
    commit_message="Auto commit at $timestamp"
else
    commit_message="$msg (at $timestamp)"
fi

# 添加所有修改
git add .

# 提交
git commit -m "$commit_message"

# 推送
git push
