# Linux Exam Sheet A - Answer Key
## Dr. Husam Al-Kanani - Mustafa University

### Question 1: Practical Command Execution (10 points)
**Command:** `ls -l /etc/passwd`

**Expected Output:**
```
-rw-r--r-- 1 root root 1234 Oct 27 2025 /etc/passwd
```

**Explanation:**
This command displays detailed information about the /etc/passwd file:
- File permissions (-rw-r--r--)
- Owner and group (root root)
- File size (1234 bytes)
- Last modification date
- File path

### Question 2: File System Navigation
**Answer:** Use `cd` command to navigate between directories
- `cd /home` - Change to home directory
- `cd ..` - Go up one level
- `cd ~` - Go to user home directory

### Question 3: File Permissions
**Answer:** Linux uses rwx permissions:
- r (read) = 4
- w (write) = 2  
- x (execute) = 1
- Example: 755 = rwxr-xr-x

---
**© 2025 Dr. Husam Al-Kanani - Linux Essentials Mid-Term Exam**