# Linux Exam Answers - Private Repository Setup

## Overview
This repository contains secure answer keys for Linux Essentials Mid-Term Exam sheets. Each exam sheet has a unique QR code that links to its corresponding answer file with a private access token.

## Repository Setup Instructions

### 1. Create Private GitHub Repository
1. Log into your GitHub account
2. Create a new **private** repository named: `linux-exam-answers`
3. Initialize with README
4. Set repository visibility to **Private**

### 2. Upload Answer Files
Upload the following files to the repository:
- `sheet-a-answers.md`
- `sheet-b-answers.md`
- `sheet-c-answers.md`
- `sheet-d-answers.md`
- `sheet-e-answers.md`
- `sheet-f-answers.md`

### 3. Generate Personal Access Tokens
For each answer file, you need to create a unique access token:

1. Go to GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token (classic)
3. Set expiration as needed (recommend exam period duration)
4. Select scope: `repo` (Full control of private repositories)
5. Create 6 different tokens for each sheet

### 4. Create Secure URLs
For each answer file, create a URL with the following format:
```
https://github.com/USERNAME/linux-exam-answers/blob/main/FILENAME.md?token=PERSONAL_ACCESS_TOKEN
```

Replace:
- `USERNAME` with your GitHub username
- `FILENAME` with the respective sheet filename
- `PERSONAL_ACCESS_TOKEN` with the unique token for that sheet

### 5. Update LaTeX File URLs
Update the QR code URLs in `Professional_Exam_Sheets.tex` with your actual:
- GitHub username
- Repository name
- Personal access tokens

### Current URL Structure in LaTeX:
- Sheet A: `https://github.com/hussamalkinani/linux-exam-answers/blob/main/sheet-a-answers.md?token=GHSAT0AAAAAACXJ7A`
- Sheet B: `https://github.com/hussamalkinani/linux-exam-answers/blob/main/sheet-b-answers.md?token=GHSAT0AAAAAACXJ7B`
- Sheet C: `https://github.com/hussamalkinani/linux-exam-answers/blob/main/sheet-c-answers.md?token=GHSAT0AAAAAACXJ7C`
- Sheet D: `https://github.com/hussamalkinani/linux-exam-answers/blob/main/sheet-d-answers.md?token=GHSAT0AAAAAACXJ7D`
- Sheet E: `https://github.com/hussamalkinani/linux-exam-answers/blob/main/sheet-e-answers.md?token=GHSAT0AAAAAACXJ7E`
- Sheet F: `https://github.com/hussamalkinani/linux-exam-answers/blob/main/sheet-f-answers.md?token=GHSAT0AAAAAACXJ7F`

## Security Features

### 1. Private Repository
- Repository is set to private, preventing public access
- Only authorized users with proper tokens can access

### 2. Unique Access Tokens
- Each exam sheet has a unique personal access token
- Tokens can be revoked individually if compromised
- Tokens have expiration dates for time-limited access

### 3. QR Code Protection
- Answers are only accessible by scanning the QR code
- No direct web access without proper authentication
- Token-based authentication adds security layer

### 4. Content Protection
- Markdown files include confidentiality notices
- Repository settings prevent unauthorized forking
- Access logs can be monitored through GitHub

## Compilation Requirements

### LaTeX Packages Required:
```latex
\usepackage{qrcode}
\usepackage{hyperref}
```

### Compilation Commands:
```bash
pdflatex Professional_Exam_Sheets.tex
pdflatex Professional_Exam_Sheets.tex  # Run twice for proper QR code generation
```

## Usage During Exam

### For Instructors:
1. Print exam sheets with QR codes
2. Distribute to students normally
3. Students scan QR codes to access answers during review
4. Monitor GitHub access logs if needed

### For Students:
1. Complete exam questions as normal
2. After submission, scan QR code with mobile device
3. QR code provides direct access to answer key
4. Compare answers for immediate feedback

## Token Management

### Best Practices:
- Create tokens just before exam period
- Set appropriate expiration dates
- Use descriptive token names (e.g., "Sheet-A-Answers-Nov2025")
- Revoke tokens immediately after exam period
- Monitor token usage through GitHub settings

### Token Renewal:
If tokens expire or need renewal:
1. Generate new personal access tokens
2. Update URLs in LaTeX file
3. Recompile PDF with new QR codes
4. Test QR codes before exam distribution

## Troubleshooting

### QR Code Not Working:
- Verify token is active and not expired
- Check repository is private but accessible with token
- Ensure URL format is correct
- Test URL in browser with token parameter

### Compilation Issues:
- Install required LaTeX packages: `tlmgr install qrcode`
- Ensure pdflatex is used (not latex)
- Check for special characters in URLs

### Access Issues:
- Verify personal access token has correct permissions
- Check repository name and username in URLs
- Ensure files are uploaded to correct repository location

---

**Important:** Keep this repository private and manage access tokens carefully to maintain exam security and integrity.