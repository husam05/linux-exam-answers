# Linux Exam Sheet D — Professional Answer Key
## Dr. Husam Al-Kanani · AlMustafa University

> This key mirrors the exact questions on Sheet D. Outputs shown are examples.

### Question 1: Practical Command Execution (10 points)
Command to run:

`df -h`

Expected sample output (excerpt):

```
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   20G   28G  42% /
tmpfs           3.9G     0  3.9G   0% /dev/shm
/dev/sda2       100G   45G   50G  48% /home
```

Explanation notes:
- Shows disk space usage for mounted filesystems.
- Human-readable units due to `-h` (KB/MB/GB).
- Columns include total size, used, available, percentage, and mountpoint.

---

### Question 2: Theoretical Knowledge (10 points)
MCQ: What does the `df -h` command display in Linux?

Correct answer: **b) Disk space usage in human-readable format**

Justification: `df` reports filesystem disk space usage; `-h` prints sizes in human-readable units instead of blocks.

---

© 2025 · Linux Essentials Mid-Term Exam · Answer Key (Sheet D)
