# Linux Exam Sheet B - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: Process Management (10 points)
**Command:** `ps aux | grep nginx`

**Expected Output:**
```
root     1234  0.0  0.1  12345  6789 ?        Ss   10:00   0:00 nginx: master
www-data 1235  0.0  0.0  12345  5678 ?        S    10:00   0:00 nginx: worker
```

**Explanation:**
- Shows all nginx processes running on the system
- Displays process ID, CPU/memory usage, start time
- Master and worker process architecture

### Question 2: Network Configuration
**Answer:** Use `ifconfig` or `ip addr` to view network settings
- IP address configuration
- Network interface status
- MAC address information

### Question 3: Service Management
**Answer:** systemctl commands:
- `systemctl start service` - Start service
- `systemctl stop service` - Stop service
- `systemctl status service` - Check status

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**