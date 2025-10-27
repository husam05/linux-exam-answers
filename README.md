# Linux Exam Answer Access System
**Dr. Husam Al-Kanani - Mustafa University**

## نظام الوصول إلى إجابات امتحان Linux

This system provides secure, authenticated access to exam answers through QR codes with student ID verification.

## System Components / مكونات النظام

### Files / الملفات:
- `Professional_Exam_Sheets.tex` - Main exam document with QR codes
- `exam-server.py` - Python Flask authentication server  
- `templates/auth.html` - Arabic web interface for authentication
- `students-database.csv` - Database of 77 students with Arabic names
- `start-server.bat` - Windows startup script

## How to Use / كيفية الاستخدام

### Step 1: Start the Authentication Server
**Double-click `start-server.bat`** or run manually:
```cmd
python exam-server.py
```

The server will start on: `http://localhost:5000`

### Step 2: Generate PDF
Compile the LaTeX document:
```cmd
pdflatex Professional_Exam_Sheets.tex
```

### Step 3: Student Access Flow
1. **Student scans QR code** from exam sheet with mobile camera
2. **Opens authentication page** (Arabic interface)
3. **Enters student ID** (1-77)
4. **System verifies identity** and displays Arabic name
5. **Provides personalized access** to GitHub answer key

## Student Authentication / تحقق هوية الطلاب

The system includes **77 students** with:
- Student ID numbers (1-77)
- Full Arabic names
- Access logging and verification

### Sample Students:
- ID 1: احمد سعدون جبار لفتة
- ID 2: احمد مثنى غازي سليم  
- ID 3: احمد ناطق جميل صادق
- ... (77 total students)

## Security Features / الميزات الأمنية

- ✅ **Student ID verification** - Only registered students can access
- ✅ **Arabic name display** - Personalized confirmation
- ✅ **Access logging** - All attempts logged with timestamps
- ✅ **GitHub integration** - Private repository access
- ✅ **Mobile-optimized QR codes** - Enhanced size (2.8cm) for camera scanning

## URL Structure

- **Authentication Page**: `http://localhost:5000?sheet=A` (replace A with B,C,D,E,F)
- **Direct Answer Access**: Only after student authentication
- **Access Logs**: `http://localhost:5000/logs` (instructor only)

## GitHub Integration

**To complete setup**, replace placeholder tokens in:
- `exam-server.py` (line ~15): Update `ANSWER_URLS` with your GitHub URLs
- Add your personal access token for private repository access

## Technical Requirements

- **Python 3.7+** with Flask
- **LaTeX** with packages: qrcode, tcolorbox, tikz, hyperref
- **Mobile device** with camera for QR scanning
- **Web browser** with Arabic/RTL support

## Access Workflow

```
QR Code Scan → Authentication Page → Student ID Entry → 
Arabic Name Verification → Personalized GitHub Access → Answer Key
```

## Troubleshooting

### Server won't start:
- Check Python installation: `python --version`
- Install Flask: `pip install flask`
- Check port 5000 is available

### QR codes don't work:
- Ensure server is running on localhost:5000
- Verify QR code URLs in LaTeX match server endpoints
- Check mobile camera can focus on QR code (2.8cm size optimized)

### LaTeX compilation fails:
- Install required packages: `qrcode`, `tcolorbox`, `tikz`
- Check Unicode support for Arabic text

## Support

Created for **Linux Essentials Course - Mid-Term Exam**  
**جامعة المصطفى - كلية الهندسة التقنية للأمن السيبراني**

---

© 2025 Dr. Husam Al-Kanani - Secure Exam Authentication System