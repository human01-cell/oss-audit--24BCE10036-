#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Software: Firefox
# Checks if a package is installed and displays its details

PACKAGE="firefox"

echo "==============================="
echo " FOSS Package Inspector"
echo "==============================="

# --- Detect package manager and check installation ---
if command -v rpm &>/dev/null; then
    if rpm -q $PACKAGE &>/dev/null; then
        echo "[OK] $PACKAGE is INSTALLED (RPM system)"
        echo "--- Package Details ---"
        rpm -qi $PACKAGE | grep -E 'Version|License|Summary|URL'
    else
        echo "[!!] $PACKAGE is NOT installed on this system."
        echo "     Install with: sudo dnf install $PACKAGE"
    fi
elif command -v dpkg &>/dev/null; then
    if dpkg -l $PACKAGE 2>/dev/null | grep -q "^ii"; then
        echo "[OK] $PACKAGE is INSTALLED (DEB system)"
        echo "--- Package Details ---"
        dpkg -l $PACKAGE | grep "^ii" | awk '{print "Version:", $3}'
        apt-cache show $PACKAGE 2>/dev/null | grep -E 'Version|License|Description' | head -5
    else
        echo "[!!] $PACKAGE is NOT installed on this system."
        echo "     Install with: sudo apt install $PACKAGE"
    fi
else
    echo "Unknown package manager. Checking binary directly."
    if command -v firefox &>/dev/null; then
        echo "[OK] Firefox binary found at: $(which firefox)"
        firefox --version
    fi
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# --- Case statement: philosophy note per package ---
case $PACKAGE in
    firefox)
        echo "Firefox: The non-profit browser proving the web belongs to everyone." ;;
    httpd|apache2)
        echo "Apache: The web server that built the open internet -- still going strong." ;;
    mysql|mariadb)
        echo "MySQL/MariaDB: Open source at the heart of millions of applications." ;;
    git)
        echo "Git: Linus built it when proprietary version control failed him." ;;
    python3|python)
        echo "Python: A language shaped entirely by community." ;;
    vlc)
        echo "VLC: Built by students in Paris -- plays anything, costs nothing." ;;
    *)
        echo "$PACKAGE: Every great tool has an open-source story behind it." ;;
esac

echo "==============================="
