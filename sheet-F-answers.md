# Linux Exam Sheet F - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: Network Troubleshooting (10 points)
**Command:** `netstat -tuln | grep :80`

**Expected Output:**
```
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN
tcp6       0      0 :::80                   :::*                    LISTEN
```

**Explanation:**
- Shows listening ports on port 80 (HTTP)
- Displays both IPv4 and IPv6 bindings
- Useful for web server troubleshooting

### Question 2: Environment Variables
**Answer:** Environment variable commands:
- `export VAR=value` - Set variable
- `echo $PATH` - Display PATH variable
- `env | grep USER` - Show user variables

### Question 3: Cron Jobs
**Answer:** Scheduled task management:
- `crontab -l` - List cron jobs
- `crontab -e` - Edit cron jobs
- Format: `* * * * * command` (min hour day month weekday)

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**