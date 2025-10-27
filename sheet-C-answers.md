# Linux Exam Sheet C - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: File Manipulation (10 points)
**Command:** `find /var/log -name "*.log" -size +1M`

**Expected Output:**
```
/var/log/syslog
/var/log/apache2/access.log
/var/log/mysql/error.log
```

**Explanation:**
- Searches /var/log directory for .log files
- Filters files larger than 1MB
- Useful for log file management

### Question 2: Text Processing
**Answer:** Use grep, sed, awk for text manipulation:
- `grep "pattern" file` - Search text
- `sed 's/old/new/g' file` - Replace text
- `awk '{print $1}' file` - Extract columns

### Question 3: Archive Management
**Answer:** tar command usage:
- `tar -czf archive.tar.gz folder/` - Create compressed archive
- `tar -xzf archive.tar.gz` - Extract archive

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**