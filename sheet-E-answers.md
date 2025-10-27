# Linux Exam Sheet E - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: Package Management (10 points)
**Command:** `apt list --installed | grep -i security`

**Expected Output:**
```
libssl1.1/focal-updates,focal-security,now 1.1.1f-1ubuntu2.16 amd64 [installed]
openssl/focal-updates,focal-security,now 1.1.1f-1ubuntu2.16 amd64 [installed]
```

**Explanation:**
- Lists installed packages related to security
- Shows version and repository information
- Helps track security updates

### Question 2: Log Analysis
**Answer:** Log file locations and commands:
- `/var/log/syslog` - System messages
- `tail -f /var/log/auth.log` - Monitor authentication
- `journalctl -xe` - SystemD logs

### Question 3: Backup Strategy
**Answer:** Backup methods:
- `rsync -av source/ destination/` - Sync directories
- `crontab -e` - Schedule automatic backups
- `dd if=/dev/sda of=backup.img` - Disk imaging

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**