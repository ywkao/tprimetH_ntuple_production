#!/bin/bash
TIME=$(date +"%Y%m%d_%H%M%S")
LOG="./dir_log/log_${TIME}.txt"
COMMAND="time ./test.sh 2>&1 | tee ${LOG}"

#echo "[INFO] start running the command: ${COMMAND}"; ${COMMAND}
echo "[INFO] start running the command: ${COMMAND}"; time ./test.sh 2>&1 | tee ${LOG}

echo "[INFO] log message can be found here: ${LOG}"
