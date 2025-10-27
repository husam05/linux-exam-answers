from flask import Flask, render_template, request, jsonify, redirect, url_for
import json
import logging
from datetime import datetime
import os

app = Flask(__name__)

# Student database
STUDENTS = {
    1: "احمد سعدون جبار لفتة", 2: "احمد مثنى غازي سليم", 3: "احمد ناطق جميل صادق",
    4: "احمد وسام عبد الصاحب عبد الله", 5: "الزهراء حسنين محمد عبد الرضا", 6: "ايثار عامر احمد زيدان",
    7: "تبارك صاحب فهد خليفه", 8: "حسن سعد فرحان علي", 9: "حسن علي عجرم حسين", 
    10: "حسين بادي عجرش جويد", 11: "حسين رائد زوير عليوي", 12: "حسين رسول فرج نافض",
    13: "حمزه حيدر حمزة صادق", 14: "حيدر عباس فاضل عباس", 15: "حيدر عدي داخل رشم",
    16: "حيدر علي حسن مهنا", 17: "ختام رزاق حاتم زوير", 18: "رضا عدنان رضا مراد",
    19: "رقية عادل عباس شايع", 20: "رقيه اياد مذكور عزيز", 21: "ريام علي حسين علي",
    22: "ريام ماجد كاظم جواد", 23: "زهراء انور سلمان سعيد", 24: "زينب طالب جاسم سلمان",
    25: "سجاد خماس حيدر حافظ", 26: "سجاد سعد كريم حسن", 27: "شهيناز محسن جاسم خلف",
    28: "شيماء حسن عبيد سيلان", 29: "ضي مهدي صالح جابر", 30: "طه اسامه باسم مهدي",
    31: "عباس كامل جلوب حرفش", 32: "عبد الجبار فارس عبد الجبار عبد", 33: "عبد العزيز طاهر صالح احمد",
    34: "عبد الله بشير مبارك محمد", 35: "عبد الله حميد فليح حسن", 36: "عبد الله علاء عادل حسن",
    37: "علي احمد مصطفى عبد الله", 38: "علي جاسم سالم عصيده", 39: "علي جمال ناصر عبد",
    40: "علي حاتم زرع الله فرهود", 41: "علي حسام عبد العزيز صدام", 42: "علي قاسم حمود جابر",
    43: "علي وسام ناظم جنيت", 44: "عمار ابراهيم حمدي عباس", 45: "فاضل ابراهيم فاضل محمد",
    46: "فاضل زيدان خوف الله حسن", 47: "فاطمه عادل عباس شايع", 48: "فرح علي حسين مزعل",
    49: "كرار حسن عبد الرضا سوادي", 50: "كرار عباس رحيم جاسم", 51: "كرار علاء مهدي شلش",
    52: "مازن احمد سهام اسماعيل", 53: "مجتبى سليم أرزيج سالم", 54: "محمد الصادق علي جادر عبد",
    55: "محمد باقر ماجد سيد حسين", 56: "محمد جاسم محمد عبد", 57: "محمد رياض حسين عبد الله",
    58: "محمد عامر عباس سعيد", 59: "محمد علاء حسين خنيصر", 60: "محمد علي عبد المجيد رشيد",
    61: "محمد علي نعثل حنين", 62: "محمد قيصر فاضل مهلهل", 63: "مصدق رحيم عطيه علي",
    64: "مصطفى جاسم محمد زبون", 65: "مصطفى خليل ابراهيم عبد الكريم", 66: "مصطفى كاظم ثويني مذبوب",
    67: "مصطفى كامل عبد الامير مجيد", 68: "مصطفى ماهر عبد العباس علي", 69: "منتظر حمود حسين ربيع",
    70: "منتظر علي حسين علوان", 71: "موسى شاكر كحيط كريم", 72: "نغم عبد اللطيف محمود علي",
    73: "نور مهند عبد الكريم شغيدل", 74: "وسن عبد الستار عبد الرسول فرحان", 75: "ولاء سالم جاسم سالم",
    76: "يزن علي غازي عبد الحسين", 77: "يوسف احمد حسن علي"
}

# Answer URLs - Private GitHub Repository
ANSWER_URLS = {
    'A': 'https://github.com/husam05/linux-exam-answers/blob/master/sheet-A-answers.md',
    'B': 'https://github.com/husam05/linux-exam-answers/blob/master/sheet-B-answers.md',
    'C': 'https://github.com/husam05/linux-exam-answers/blob/master/sheet-C-answers.md',
    'D': 'https://github.com/husam05/linux-exam-answers/blob/master/sheet-D-answers.md',
    'E': 'https://github.com/husam05/linux-exam-answers/blob/master/sheet-E-answers.md',
    'F': 'https://github.com/husam05/linux-exam-answers/blob/master/sheet-F-answers.md'
}

# Setup logging
logging.basicConfig(
    filename='exam_access.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

@app.route('/')
def index():
    sheet = request.args.get('sheet', 'A')
    return render_template('auth.html', sheet=sheet)

@app.route('/auth', methods=['POST'])
def authenticate():
    try:
        data = request.get_json()
        student_id = int(data.get('student_id', 0))
        exam_sheet = data.get('exam_sheet', '').upper()
        
        # Validate student ID
        if student_id not in STUDENTS:
            return jsonify({
                'success': False,
                'error': 'رقم الطالب غير صحيح. يرجى إدخال رقم صحيح من 1 إلى 77.'
            })
        
        # Validate exam sheet
        if exam_sheet not in ANSWER_URLS:
            return jsonify({
                'success': False,
                'error': 'ورقة الامتحان غير صحيحة.'
            })
        
        student_name = STUDENTS[student_id]
        answer_url = ANSWER_URLS[exam_sheet]
        
        # Log access attempt
        log_entry = f"Student ID: {student_id}, Name: {student_name}, Sheet: {exam_sheet}, IP: {request.remote_addr}"
        logging.info(f"Access granted - {log_entry}")
        app.logger.info(f"Access granted - {log_entry}")
        
        return jsonify({
            'success': True,
            'student_name': student_name,
            'answer_url': answer_url,
            'exam_sheet': exam_sheet
        })
        
    except Exception as e:
        app.logger.error(f"Authentication error: {str(e)}")
        return jsonify({
            'success': False,
            'error': 'حدث خطأ في النظام. يرجى المحاولة مرة أخرى.'
        })

@app.route('/answer/<sheet>/<int:student_id>')
def get_answer(sheet, student_id):
    """Direct access to answers with student verification"""
    if student_id not in STUDENTS or sheet.upper() not in ANSWER_URLS:
        return "غير مصرح لك بالوصول", 403
    
    student_name = STUDENTS[student_id]
    answer_url = ANSWER_URLS[sheet.upper()]
    
    # Log access
    log_entry = f"Direct access - Student ID: {student_id}, Name: {student_name}, Sheet: {sheet}, IP: {request.remote_addr}"
    logging.info(log_entry)
    
    # Redirect to GitHub with student info
    return redirect(f"{answer_url}&student_id={student_id}&student_name={student_name}")

@app.route('/logs')
def view_logs():
    """View access logs (for instructor)"""
    try:
        if os.path.exists('exam_access.log'):
            with open('exam_access.log', 'r', encoding='utf-8') as f:
                logs = f.readlines()
            return '<pre>' + ''.join(logs[-100:]) + '</pre>'  # Last 100 entries
        else:
            return "No logs found"
    except Exception as e:
        return f"Error reading logs: {str(e)}"

if __name__ == '__main__':
    # Create templates directory
    os.makedirs('templates', exist_ok=True)
    
    # Run the server
    print("Starting exam authentication server...")
    print("Access URL: http://localhost:5000")
    print("QR codes should point to: http://localhost:5000?sheet=A (change A to B,C,D,E,F)")
    app.run(debug=True, host='0.0.0.0', port=5000)