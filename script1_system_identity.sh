#!/bin/bash
# Script 1: System Identity Report
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | Software Choice: Firefox

# --- Variables ---
STUDENT_NAME="[Your Name]"
ROLL_NUMBER="[Your Roll Number]"
SOFTWARE_CHOICE="Mozilla Firefox"
LICENSE_INFO="Mozilla Public License 2.0 (MPL 2.0)"
OS_LICENSE="GPL v2"

# --- System info via command substitution ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')

# --- Display formatted output ---
echo "================================================"
echo "     Open Source Audit -- System Identity Report"
echo "================================================"
echo " Student  : $STUDENT_NAME ($ROLL_NUMBER)"
echo " Software : $SOFTWARE_CHOICE"
echo " License  : $LICENSE_INFO"
echo "------------------------------------------------"
echo " Distribution : $DISTRO"
echo " Kernel       : $KERNEL"
echo " User         : $USER_NAME"
echo " Home Dir     : $HOME_DIR"
echo " Uptime       : $UPTIME"
echo " Date/Time    : $CURRENT_DATE"
echo "------------------------------------------------"
echo " Note: The OS running this script is licensed"
echo " under $OS_LICENSE -- the kernel that"
echo " makes all open-source computing possible."
echo "================================================"
