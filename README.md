# oss-audit-\[24BCE10036]

## The Open Source Audit — Mozilla Firefox

**Course:** Open Source Software (OSS NGMC)
**Student Name:** \[Manas Saraf]
**Roll Number:** \[24BCE10036]
**Slot:** \[E22]
**Software Chosen:** Mozilla Firefox
**License:** Mozilla Public License 2.0 (MPL 2.0)

\---

## About This Project

This repository contains the shell scripts submitted as part of the Open Source Audit capstone project for the OSS NGMC course. The project involves a structured audit of Mozilla Firefox — one of the most significant open-source software projects in history — covering its origin story, license analysis, Linux footprint, FOSS ecosystem, and a comparison against its proprietary alternative (Google Chrome).

The five shell scripts below demonstrate practical Linux and bash scripting skills across the concepts covered in Units 1 to 5 of the course.

\---

## Repository Contents

|File|Description|
|-|-|
|`script1\_system\_identity.sh`|Displays a system identity report — distro, kernel, user, uptime, and date|
|`script2\_package\_inspector.sh`|Checks if Firefox is installed and prints package details and a philosophy note|
|`script3\_disk\_auditor.sh`|Audits key system directories for permissions, ownership, and disk usage|
|`script4\_log\_analyzer.sh`|Reads a log file and counts lines matching a keyword, with retry and summary|
|`script5\_manifesto\_generator.sh`|Interactively generates a personalised open source manifesto and saves it to a file|
|`README.md`|This file|

\---

## Dependencies

All scripts are written in **bash** and run on any standard Linux system. No additional packages are required beyond what is included in a default Linux installation.

|Tool Used|Purpose|Usually Pre-installed?|
|-|-|-|
|`bash`|Script interpreter|Yes|
|`uname`|Get kernel version|Yes|
|`whoami`|Get current user|Yes|
|`uptime`|System uptime|Yes|
|`date`|Date and time formatting|Yes|
|`grep`|Pattern matching in text|Yes|
|`awk`|Field extraction from command output|Yes|
|`du`|Disk usage of directories|Yes|
|`ls`|List directory permissions|Yes|
|`wc`|Count lines in files|Yes|
|`tail`|Get last N lines of a file|Yes|
|`rpm` or `dpkg`|Package inspection (Script 2)|Depends on distro|
|`apt-cache`|Package details on Debian/Ubuntu (Script 2)|On Debian/Ubuntu only|

\---

## How to Run Each Script on Linux

### Step 0 — Clone the repository

```bash
git clone https://github.com/\[your-username]/oss-audit-\[rollnumber].git
cd oss-audit-\[rollnumber]
```

### Step 1 — Make scripts executable

Before running any script, give it execute permission:

```bash
chmod +x script1\_system\_identity.sh
chmod +x script2\_package\_inspector.sh
chmod +x script3\_disk\_auditor.sh
chmod +x script4\_log\_analyzer.sh
chmod +x script5\_manifesto\_generator.sh
```

Or make all of them executable at once:

```bash
chmod +x \*.sh
```

\---

### Script 1 — System Identity Report

**What it does:** Displays a formatted welcome screen showing the Linux distribution, kernel version, logged-in user, home directory, system uptime, and current date and time. It also prints the open-source license of the running OS.

**Run it:**

```bash
./script1\_system\_identity.sh
```

**Expected output:**

```
================================================
     Open Source Audit -- System Identity Report
================================================
 Student  : \[Your Name] (\[Roll Number])
 Software : Mozilla Firefox
 License  : Mozilla Public License 2.0 (MPL 2.0)
------------------------------------------------
 Distribution : Ubuntu 22.04.3 LTS
 Kernel       : 5.15.0-91-generic
 User         : student
 Home Dir     : /home/student
 Uptime       : up 2 hours, 34 minutes
 Date/Time    : Monday, 01 January 2025 10:30:00
------------------------------------------------
 Note: The OS running this script is licensed
 under GPL v2 -- the kernel that
 makes all open-source computing possible.
================================================
```

\---

### Script 2 — FOSS Package Inspector

**What it does:** Detects whether the system uses RPM or DEB packaging, checks whether Firefox is installed, retrieves version and license details, and uses a case statement to print a philosophy note about the package.

**Run it:**

```bash
./script2\_package\_inspector.sh
```

**Note:** If Firefox is not installed, install it first:

* Ubuntu/Debian: `sudo apt install firefox`
* Fedora/RHEL: `sudo dnf install firefox`

\---

### Script 3 — Disk and Permission Auditor

**What it does:** Loops through important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/usr/lib`, `/var`) and prints a formatted table showing permissions, ownership, and disk size for each. Then checks specifically for Firefox-related directories.

**Run it:**

```bash
./script3\_disk\_auditor.sh
```

**Note:** Some directories like `/var` may take a few seconds to calculate size. This is normal.

\---

### Script 4 — Log File Analyzer

**What it does:** Reads a log file line by line, counts how many lines contain a given keyword (case-insensitive), and prints the last 5 matching lines. Takes the log file path as the first argument and the keyword as an optional second argument (defaults to `error`).

**Run it:**

```bash
# Basic usage with default keyword 'error'
./script4\_log\_analyzer.sh /var/log/syslog

# With a custom keyword
./script4\_log\_analyzer.sh /var/log/syslog warning

# On systems where /var/log/syslog doesn't exist, try:
./script4\_log\_analyzer.sh /var/log/messages error
# or create a test log file:
echo -e "INFO: system started\\nERROR: disk read failed\\nWARNING: low memory\\nERROR: timeout" > /tmp/test.log
./script4\_log\_analyzer.sh /tmp/test.log error
```

\---

### Script 5 — The Open Source Manifesto Generator

**What it does:** Asks the user three interactive questions, then generates a personalised open-source philosophy statement using their answers and saves it to a `.txt` file named `manifesto\_\[username]\_\[date].txt`.

**Run it:**

```bash
./script5\_manifesto\_generator.sh
```

**You will be asked:**

1. Name one open-source tool you use every day
2. In one word, what does 'freedom' mean to you?
3. Name one thing you would build and share freely

**The manifesto is saved to:** `manifesto\_\[yourusername]\_\[YYYYMMDD].txt` in the current directory.

\---

## Shell Concepts Demonstrated

|Concept|Scripts|
|-|-|
|Variables and assignment|1, 2, 3, 4, 5|
|Command substitution `$()`|1, 2, 3, 4, 5|
|`if-then-else` conditionals|2, 3, 4|
|`case` statement|2|
|`for` loop with arrays|3|
|`while read` loop|4|
|Counter variables `$(( ))`|4|
|Command-line arguments `$1`, `$2`|4|
|Default argument values `${2:-default}`|4|
|`read` for interactive user input|5|
|File redirection `>` and `>>`|5|
|File tests `-f`, `-d`, `-s`|3, 4|
|`grep`, `awk`, `cut`, `tr`|1, 2, 3, 4|
|`printf` for formatted output|3|
|Alias concept (demonstrated in comments)|5|

\---

## Notes

* All scripts include comments explaining each section, as required by the project rubric.
* Script 2 automatically detects whether the system uses RPM or DEB packaging and adjusts accordingly.
* Script 4 includes a retry mechanism if the log file is empty on first read.
* Scripts were tested on Ubuntu 22.04 LTS. They should work on any modern bash-compatible Linux system.

\---

*Submitted as part of the Open Source Software (OSS NGMC) Capstone Project — VITyarthi*

