# How to Compile Personalized Exam Sheets

## Important: Use XeLaTeX, NOT pdflatex!

The personalized exam sheets include Arabic student names which require **XeLaTeX** to compile correctly.

### Compile Commands:

**For Personalized Exam Sheets (with Arabic names):**
```powershell
xelatex -interaction=nonstopmode Personalized_Exam_Sheets.tex
```

**For Generic Exam Sheets (without names):**
```powershell
pdflatex -interaction=nonstopmode Professional_Exam_Sheets.tex
```

## Why XeLaTeX?

- **XeLaTeX** has native UTF-8 and Arabic font support
- **pdflatex** cannot handle Arabic Unicode characters properly
- The Personalized_Exam_Sheets.tex file uses `fontspec` package which requires XeLaTeX

## File Structure:

- `Personalized_Exam_Sheets.tex` - 29 personalized sheets with pre-printed student IDs and Arabic names
- `Personalized_Exam_Sheets.pdf` - Compiled output (29 pages, one per student)
- `Professional_Exam_Sheets.tex` - Generic template (6 sheets A-F, no personalization)
- `Professional_Exam_Sheets.pdf` - Generic exam sheets

## Student Distribution Across Sheets:

- **Sheet A**: 5 students (IDs: 10579, 10591, 10607, 10628, 10642)
- **Sheet B**: 5 students (IDs: 10580, 10597, 10610, 10631, 10643)
- **Sheet C**: 5 students (IDs: 10582, 10601, 10611, 10633, 10648)
- **Sheet D**: 5 students (IDs: 10584, 10603, 10614, 10634, 10649)
- **Sheet E**: 5 students (IDs: 10588, 10605, 10617, 10639, 10655)
- **Sheet F**: 4 students (IDs: 10590, 10606, 10618, 10641)

## QR Code Links:

Each QR code points to: `https://husam05.github.io/linux-exam-answers/student-auth-77.html?sheet=[A/B/C/D/E/F]`

- The QR parameter matches the student's assigned sheet type
- Students scan → enter their 5-digit ID → see their Arabic name → access answers

## System Tested On:

- MiKTeX 25.4 on Windows
- XeTeX Version 3.141592653-2.6-0.999997
- Fonts: Arial (with Arabic script support)
