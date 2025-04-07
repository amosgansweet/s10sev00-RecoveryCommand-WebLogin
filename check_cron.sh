#!/bin/bash

CRON_S5="nohup $HOME/.5sweb/5sweb -c $HOME/.5sweb/config.json >/dev/null 2>&1 &"
CRON_NEZHA="nohup $HOME/.tneganz/start.sh >/dev/null 2>&1 &"
SB10="nohup $HOME/restartsb.sh  >/dev/null 2>&1 &"




echo "检查是否运行，如果无，就启动"
 ps aux | grep -v grep | grep s10sb > /dev/null || bash -c "$SB10"
 ps aux | grep -v grep | grep 5sweb > /dev/null || bash -c "$CRON_S5"
 ps aux | grep -v grep | grep tneganz > /dev/null || bash -c "$CRON_NEZHA"
