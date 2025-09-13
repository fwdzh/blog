# push.ps1
# 自动提交并推送 Git 仓库，commit message 可选且带时间戳

param(
    [string]$msg = ""  # 默认空
)

# 获取当前时间
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# 生成最终 commit message
if ([string]::IsNullOrWhiteSpace($msg)) {
    $commitMessage = "Auto commit at $timeStamp"
} else {
    $commitMessage = "$msg (at $timeStamp)"
}

# 添加所有修改的文件
git add .

# 提交
git commit -m $commitMessage

# 推送到默认远程和分支
git push
