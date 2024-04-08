#!/bin/bash

# 获取所有 tmux 会话的列表
sessions=$(tmux ls | cut -d: -f1)

# 关闭每个会话中的所有窗口
for session in $sessions; do
    tmux kill-session -t "$session"
done

