# Script to Create Answer Files for GitHub Repository
# Run this script to create the answer markdown files for each exam sheet

# Create Sheet A Answers
echo "# Linux Exam Sheet A - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: Practical Command Execution (10 points)
**Command:** \`ls -l /etc/passwd\`

**Expected Output:**
\`\`\`
-rw-r--r-- 1 root root 1234 Oct 27 2025 /etc/passwd
\`\`\`

**Explanation:**
This command displays detailed information about the /etc/passwd file:
- File permissions (-rw-r--r--)
- Owner and group (root root)
- File size (1234 bytes)
- Last modification date
- File path

### Question 2: File System Navigation
**Answer:** Use \`cd\` command to navigate between directories
- \`cd /home\` - Change to home directory
- \`cd ..\` - Go up one level
- \`cd ~\` - Go to user home directory

### Question 3: File Permissions
**Answer:** Linux uses rwx permissions:
- r (read) = 4
- w (write) = 2  
- x (execute) = 1
- Example: 755 = rwxr-xr-x

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**" > sheet-A-answers.md

# Create Sheet B Answers
echo "# Linux Exam Sheet B - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: Process Management (10 points)
**Command:** \`ps aux | grep nginx\`

**Expected Output:**
\`\`\`
root     1234  0.0  0.1  12345  6789 ?        Ss   10:00   0:00 nginx: master
www-data 1235  0.0  0.0  12345  5678 ?        S    10:00   0:00 nginx: worker
\`\`\`

**Explanation:**
- Shows all nginx processes running on the system
- Displays process ID, CPU/memory usage, start time
- Master and worker process architecture

### Question 2: Network Configuration
**Answer:** Use \`ifconfig\` or \`ip addr\` to view network settings
- IP address configuration
- Network interface status
- MAC address information

### Question 3: Service Management
**Answer:** systemctl commands:
- \`systemctl start service\` - Start service
- \`systemctl stop service\` - Stop service
- \`systemctl status service\` - Check status

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**" > sheet-B-answers.md

# Create Sheet C Answers
echo "# Linux Exam Sheet C - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: File Manipulation (10 points)
**Command:** \`find /var/log -name \"*.log\" -size +1M\`

**Expected Output:**
\`\`\`
/var/log/syslog
/var/log/apache2/access.log
/var/log/mysql/error.log
\`\`\`

**Explanation:**
- Searches /var/log directory for .log files
- Filters files larger than 1MB
- Useful for log file management

### Question 2: Text Processing
**Answer:** Use grep, sed, awk for text manipulation:
- \`grep \"pattern\" file\` - Search text
- \`sed 's/old/new/g' file\` - Replace text
- \`awk '{print $1}' file\` - Extract columns

### Question 3: Archive Management
**Answer:** tar command usage:
- \`tar -czf archive.tar.gz folder/\` - Create compressed archive
- \`tar -xzf archive.tar.gz\` - Extract archive

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**" > sheet-C-answers.md

# Create Sheet D Answers
echo "# Linux Exam Sheet D - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: System Monitoring (10 points)
**Command:** \`top -n 1 | head -20\`

**Expected Output:**
\`\`\`
top - 10:30:25 up 5 days,  2:15,  3 users,  load average: 0.15, 0.25, 0.20
Tasks: 125 total,   1 running, 124 sleeping,   0 stopped,   0 zombie
%Cpu(s):  2.1 us,  0.8 sy,  0.0 ni, 97.0 id,  0.1 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   3932.5 total,   1245.7 free,   1234.2 used,   1452.6 buff/cache
\`\`\`

**Explanation:**
- System uptime and load average
- CPU and memory usage statistics
- Running processes summary

### Question 2: Disk Usage
**Answer:** Use \`df -h\` to check disk space:
- Shows filesystem usage in human-readable format
- Displays available space per partition
- Helps identify storage issues

### Question 3: User Management
**Answer:** User account commands:
- \`useradd username\` - Add new user
- \`usermod -aG group user\` - Add user to group
- \`passwd username\` - Change password

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**" > sheet-D-answers.md

# Create Sheet E Answers
echo "# Linux Exam Sheet E - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: Package Management (10 points)
**Command:** \`apt list --installed | grep -i security\`

**Expected Output:**
\`\`\`
libssl1.1/focal-updates,focal-security,now 1.1.1f-1ubuntu2.16 amd64 [installed]
openssl/focal-updates,focal-security,now 1.1.1f-1ubuntu2.16 amd64 [installed]
\`\`\`

**Explanation:**
- Lists installed packages related to security
- Shows version and repository information
- Helps track security updates

### Question 2: Log Analysis
**Answer:** Log file locations and commands:
- \`/var/log/syslog\` - System messages
- \`tail -f /var/log/auth.log\` - Monitor authentication
- \`journalctl -xe\` - SystemD logs

### Question 3: Backup Strategy
**Answer:** Backup methods:
- \`rsync -av source/ destination/\` - Sync directories
- \`crontab -e\` - Schedule automatic backups
- \`dd if=/dev/sda of=backup.img\` - Disk imaging

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**" > sheet-E-answers.md

# Create Sheet F Answers
echo "# Linux Exam Sheet F - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: Network Troubleshooting (10 points)
**Command:** \`netstat -tuln | grep :80\`

**Expected Output:**
\`\`\`
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN
tcp6       0      0 :::80                   :::*                    LISTEN
\`\`\`

**Explanation:**
- Shows listening ports on port 80 (HTTP)
- Displays both IPv4 and IPv6 bindings
- Useful for web server troubleshooting

### Question 2: Environment Variables
**Answer:** Environment variable commands:
- \`export VAR=value\` - Set variable
- \`echo $PATH\` - Display PATH variable
- \`env | grep USER\` - Show user variables

### Question 3: Cron Jobs
**Answer:** Scheduled task management:
- \`crontab -l\` - List cron jobs
- \`crontab -e\` - Edit cron jobs
- Format: \`* * * * * command\` (min hour day month weekday)

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**" > sheet-F-answers.md

echo "✅ All answer files created successfully!"
echo "Now upload these files to your GitHub repository:"
echo "1. Go to https://github.com/husam05/linux-exam-answers"
echo "2. Upload each sheet-X-answers.md file"
echo "3. Commit with message: 'Add Linux exam answer keys'"