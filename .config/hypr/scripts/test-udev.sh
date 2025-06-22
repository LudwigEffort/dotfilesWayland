#!/bin/bash

LOG_FILE="/home/ludwig/.cache/my-log/test-udev.txt"

# Scrive "Hello World" con la data corrente nel file
echo "$(date '+%Y-%m-%d %H:%M:%S') - Hello World" >> "$LOG_FILE"

echo "Messaggio scritto su $LOG_FILE"
