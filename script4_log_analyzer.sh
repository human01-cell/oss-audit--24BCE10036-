#!/bin/bash
# Script 4: Log File Analyzer
# Author: [Your Name] | Software: Firefox
# Usage: ./script4_log_analyzer.sh /path/to/logfile [keyword]

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0
TEMPFILE="/tmp/matches_$$.txt"

# --- Validate input ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "[!!] Error: File '$LOGFILE' not found."
    exit 1
fi

# --- Check if file is empty and retry ---
ATTEMPTS=0
while [ ! -s "$LOGFILE" ] && [ $ATTEMPTS -lt 3 ]; do
    echo "[!!] File is empty. Waiting 2 seconds... (attempt $((ATTEMPTS+1))/3)"
    sleep 2
    ATTEMPTS=$((ATTEMPTS + 1))
done

if [ ! -s "$LOGFILE" ]; then
    echo "[!!] File is still empty after retries. Exiting."
    exit 1
fi

echo "========================================"
echo " Log File Analyzer"
echo " File   : $LOGFILE"
echo " Keyword: $KEYWORD (case-insensitive)"
echo "========================================"

# --- While read loop ---
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        echo "$LINE" >> "$TEMPFILE"
    fi
done < "$LOGFILE"

echo " Total lines scanned : $(wc -l < "$LOGFILE")"
echo " Keyword matches     : $COUNT"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "--- Last 5 matching lines ---"
    tail -5 "$TEMPFILE"
else
    echo "[OK] No lines containing '$KEYWORD' were found."
fi

rm -f "$TEMPFILE"
echo "========================================"
