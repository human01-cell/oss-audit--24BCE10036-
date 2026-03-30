#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Software: Firefox
# Loops through key directories and reports permissions and size

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib" "/var")

echo "========================================"
echo " Directory Audit Report"
echo " Generated: $(date '+%Y-%m-%d %H:%M:%S')"
echo "========================================"
printf "%-20s %-22s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "----------------------------------------"

# --- For loop over directory array ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-22s %-10s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"
    else
        echo "$DIR => [NOT FOUND on this system]"
    fi
done

echo "========================================"
echo ""
echo "--- Firefox Configuration Check ---"

FIREFOX_DIRS=(
    "/usr/lib/firefox"
    "/usr/lib64/firefox"
    "/etc/firefox"
    "$HOME/.mozilla/firefox"
)

FOUND=0
for FDIR in "${FIREFOX_DIRS[@]}"; do
    if [ -d "$FDIR" ]; then
        PERMS=$(ls -ld "$FDIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$FDIR" 2>/dev/null | cut -f1)
        echo "[FOUND] $FDIR"
        echo "        Permissions: $PERMS | Size: ${SIZE:-N/A}"
        FOUND=1
    fi
done

if [ $FOUND -eq 0 ]; then
    echo "[!!] No Firefox directories found."
    if command -v firefox &>/dev/null; then
        echo "     Firefox binary: $(which firefox)"
    fi
fi
echo "========================================"
