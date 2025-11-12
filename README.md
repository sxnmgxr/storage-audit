# storage-audit
Storage Audit scans your disk usage like a financial auditor, pinpointing exactly where space is being consumed. It identifies largest files/folders, analyzes storage patterns, flags space hogs, and provides cleanup recommendations - giving you complete visibility and control over your disk space utilization.

# System Insight (sysinsight)

A comprehensive bash script that provides detailed storage and memory usage reports with professional formatting and actionable insights.

## 🚀 Features

- **Disk Space Analysis** - Complete filesystem usage with warnings
- **Memory Monitoring** - RAM and swap usage with percentage calculations  
- **Large File Detection** - Identify space-consuming files
- **Directory Analysis** - Find largest folders consuming storage
- **Color-coded Reports** - Easy-to-read formatted output
- **Customizable Scans** - Target specific directories and result counts

## 📦 Installation

```bash
# Download the script
wget https://raw.githubusercontent.com/yourusername/sysinsight/main/sysinsight.sh
chmod +x sysinsight.sh

# Optional: Install system-wide
sudo cp sysinsight.sh /usr/local/bin/sysinsight

# Basic system scan
./sysinsight.sh

# Scan specific directory, show top 5 results
./sysinsight.sh -d /var -n 5

# Get help
./sysinsight.sh --help
