#!/bin/bash

USER=$(whoami)
WORKDIR="/home/${USER}/.nezha-agent"
FILE_PATH="/home/${USER}/.s5"
CRON_S5="nohup ${FILE_PATH}/s5 -c ${FILE_PATH}/config.json >/dev/null 2>&1 &"
CRON_NEZHA="nohup ${WORKDIR}/start.sh >/dev/null 2>&1 &"
SB10="/home/${USER}/restartsb.sh  >/dev/null 2>&1 &"




echo "检查是否运行，如果无，就启动"
 ps aux | grep -v grep | grep s10sb > /dev/null || bash -c "$SB10"
 ps aux | grep -v grep | grep s5 > /dev/null || bash -c "$CRON_S5"
 ps aux | grep -v grep | grep nezha-agent > /dev/null || bash -c "$CRON_NEZHA"
