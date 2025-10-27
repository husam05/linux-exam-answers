# Linux Exam Sheet D - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: System Monitoring (10 points)
**Command:** `top -n 1 | head -20`

**Expected Output:**
```
top - 10:30:25 up 5 days,  2:15,  3 users,  load average: 0.15, 0.25, 0.20
Tasks: 125 total,   1 running, 124 sleeping,   0 stopped,   0 zombie
%Cpu(s):  2.1 us,  0.8 sy,  0.0 ni, 97.0 id,  0.1 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   3932.5 total,   1245.7 free,   1234.2 used,   1452.6 buff/cache
```

**Explanation:**
- System uptime and load average
- CPU and memory usage statistics
- Running processes summary

### Question 2: Disk Usage
**Answer:** Use `df -h` to check disk space:
- Shows filesystem usage in human-readable format
- Displays available space per partition
- Helps identify storage issues

### Question 3: User Management
**Answer:** User account commands:
- `useradd username` - Add new user
- `usermod -aG group user` - Add user to group
- `passwd username` - Change password

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**