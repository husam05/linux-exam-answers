# Linux Exam Sheet A — Professional Answer Key
## Dr. Husam Al-Kanani · AlMustafa University

> This key mirrors the exact questions on Sheet A and provides concise model answers. Command outputs are examples; actual values may differ per system.

### Question 1: Practical Command Execution (10 points)
Command to run:

`ls -l /etc/passwd`

Expected sample output (one line):

```
-rw-r--r-- 1 root root 2847 Oct 15 10:30 /etc/passwd
```

Explanation notes:
- Shows detailed metadata for the file /etc/passwd.
- Permissions: `-rw-r--r--` → owner read/write; group and others read-only.
- Owner/group: `root root`; Size: bytes; Date/time of last modification.
- The file stores basic user account entries (username, UID, home, shell).

---

### Question 2: Theoretical Knowledge (10 points)
MCQ: In Linux file permissions, what does the notation "rwx" represent?

Correct answer: **a) read, write, execute**

Justification: `r` = read, `w` = write, `x` = execute. These three bits define access for owner, group, and others on files and directories.

---

© 2025 · Linux Essentials Mid-Term Exam · Answer Key (Sheet A)
