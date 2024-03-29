//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "الصفحة الرئيسية",
          "2": "الأعدادات",
          "3": "اللغة:",
          "4": "انجليزي",
          "5": "عبري",
          "6": "عربي",
          "7": "تسجيل الدخول",
          "8": "أضف شقة للبيع",
          "9": "الدردشة",
          "10": "الأتصالات",
          "11": "تسجيل الخروج",
          "12": "أسم المستخدم",
          "13": "كلمة المرور",
          "14": "نسيت كلمة المرور",
          "15": " ليس لديك حساب؟",
          "16": "التسجيل",
          "17": "الأسم الكامل",
          "18": "البريد الألكتروني",
          "19": "لديك حساب؟ ",
          "20": "يجب تسجيل رقم هاتف صالح",
          "21": "يجب تسجيل أسمك الكامل",
          "22": "يجب كتابة البريد بطريقة صحيحة",
          "23": "كلمة المرور يجب أن تحتوي 6 حروف على الأقل",
          "24": "منطقة الشمال",
          "25": "منطقة المركز",
          "26": "منطقة حيفا",
          "27": "منطقة تل أبيب-يافا",
          "28": "منطقة القدس",
          "29": "منطقة الجنوب",
          "30": ": السعر",
          "31": "الغرف: ",
          "32": "شراكة: ",
          "33": "تأجير: ",
          "34": "البلدة: ",
          "35": "الشارع: ",
          "36": "بحث",
          "37": "حذف",
          "38": "الطابق",
          "39": "شرح",
          "40": ":النوع",
          "41": "المنطقة",
          "42": "رقم الشارع",
          "43": "المركز",
          "44": "القدس",
          "45": "حيفا",
          "46": "الجنوب",
          "47": "الشمال",
          "48": "تل أبيب-يافا",
          "49": "شقة",
          "50": "منزل",
          "51": "منزل مع قبو",
          "52": "منزل مع سقف",
          "53": "وحدة سكنية",
          "54": "بينت هاوس",
          "55": "منزل مع حديقة",
          "56": "شقة فردية",
          "57": "منزل شخصي",
          "58": "تأجير",
          "59": "منزل شراكة",
          "60": 'صورة من المعرض',
          "61": 'التقط صورة',
          "62": 'المفضلة',
          "63": 'عليك تسجيل الدخول لتستطيع تشغيل هذه الميزة',
          "64": 'خطأ في البريد الالكتروني او كلمة المرور',
          "65": 'يجب ادخال البريد الالكتروني',
          "66": 'يجب ادخال بريد الكتروني صالح',
          "67": 'يجب ادخال كلمة المرور',
          "68": 'كلمة المرور يجب أن تكون من 6 حروف على الأقل',
          "69": 'أدخل كلمة المرور مجددا',
          "70": 'كلمة المرور الجديدة',
          "71": 'تغيير كلمة المرور',
          "72": 'تغيير كلمة المرور ارسل الى البريد الالكتروني المختار',
          "73": 'رقم الهاتف',
          "74": 'رقم الهوية',
          "75": 'يجب ادخال رقم الهوية',
          "76": 'رقم الهوية يجب ان يكون بين 9-11 أرقام',
          "77": 'يجب ادخال رقم الهاتف',
          "78": 'رقم الهاتف يجب ان يكون من 10 أرقام',
          "79": 'الاسم الكامل مطلوب',
          "80": 'غير مسموح باضافة ارقام للاسم الكامل',
          "81": 'هذا البريد تم استخدامه من قبل مستخدم اخر',
          "82": 'تغيير كلمة المرور',
          "83": 'حذف الحساب',
          "84": 'تم حذف الحساب بنجاح',
          "85": 'المعلومات الشخصية',
          "86": 'تغيير',
          "87": 'نشر المنزل',
          "88": 'ملكية حصرية',
          "89": 'تكييف',
          "90": 'شبابيك مغلقة',
          "91": 'سخان مياه',
          "92": 'ذوي الاحتياجات\nالخاصة',
          "93": 'مجددة',
          "94": 'ملجأ',
          "95": 'مخزن',
          "96": 'حيوانات أليفة',
          "97": 'أثاث',
          "98": 'مريح',
          "99": 'طويل الأمد',
          "100": 'أضف صور',
          "101": "المنازل التي نشرتها",
          "102": 'تكييف',
          "103": 'تغيير',
          "104": 'البناية',
          "105": 'حذف',
          "106": 'لم تقم بنشر شقة',
        },
        "he": {
          "1": "דף כניסה",
          "2": "הגדרות",
          "3": "שפה:",
          "4": "אנגלית",
          "5": "עברית",
          "6": "ערבית",
          "7": "כניסה",
          "8": "פרסם דירה",
          "9": "צאט",
          "10": "שיחות",
          "11": "יציאה",
          "12": "שם משתמש",
          "13": "סיסמה",
          "14": "שכחתי סיסמה",
          "15": "עדיין לא נרשמת? ",
          "16": "הרשמה",
          "17": "שם מלא",
          "18": "מייל",
          "19": "יש לך חשבון? ",
          "20": "חובה לרשום מספר טלפון חוקי",
          "21": "חייב לרשום שם מלא",
          "22": "תרשום מייל חוקי",
          "23": "סיסמה חייבת להיות לפחות באורך של 6 תווים",
          "24": "מחוז צפון",
          "25": "מחוז מרכז",
          "26": "מחוז חיפה",
          "27": "מחוז תל אביב-יפו",
          "28": "מחוז יורשלים",
          "29": "מחוז דרום",
          "30": ": מחיר",
          "31": "חדרים: ",
          "32": "שותפים: ",
          "33": "סאבלט: ",
          "34": "ישוב: ",
          "35": "רחוב: ",
          "36": "חיפוש",
          "37": "איפוס",
          "38": "קומה",
          "39": "הסבר",
          "40": "סוג:",
          "41": "מחוז",
          "42": "מס רחוב",
          "43": "מרכז",
          "44": "יורשלים",
          "45": "חיפה",
          "46": "דרום",
          "47": "צפון",
          "48": "תל אביב-יפו",
          "49": "דירה",
          "50": "בית",
          "51": "מרתף",
          "52": "דירת גג",
          "53": "יחידת דיור",
          "54": "פנטהאוז",
          "55": "דירת גן",
          "56": "סטודיו",
          "57": "בית פרטי",
          "58": "סאבלט",
          "59": "דירת שותפים",
          "60": 'תמונה מגלריה',
          "61": 'צלם תמונה',
          "62": 'מועדפים',
          "63": 'אתה צריך לכנס לאפליקציה לבצע פעולה זו',
          "64": 'מייל או סיסמה לא נכונים',
          "65": 'חובה להכניס מייל',
          "66": 'תרשום מייל חוקי',
          "67": 'צריך לרשום סיסמה',
          "68": 'סיסמה חייבת להיות באורך 6 תווים לפחות',
          "69": 'הכנס סיסמה שנית',
          "70": 'סיסמה חדשה',
          "71": 'החלף סיסמה',
          "72": 'שינוי סיסמה נשלח למייל הנבחר',
          "73": 'מספר טלפון',
          "74": 'תעודת זהות',
          "75": 'תעודת זהות חובה',
          "76": 'תעודת זהות חייבת להיות בין 9-11 תווים',
          "77": 'מספר טלפון חובה',
          "78": 'מספר טלפון חייב להיות מ 10 תווים',
          "79": 'חובה למלא שם מלא',
          "80": 'אסור לשם משתמש להכיל מספרים',
          "81": 'משתמש אחר משתמש במייל זה',
          "82": 'שינוי סיסמה',
          "83": 'מחיקת חשבון',
          "84": 'חשבון נמחק בהצלחה',
          "85": 'עדכון פרטים אישיים',
          "86": 'עדכון',
          "87": 'פרסם בית',
          "88": 'נכס בבלעדיות',
          "89": 'מיזוג',
          "90": 'סורגים',
          "91": 'דוד שמש',
          "92": 'גישה לנכים',
          "93": 'משופצת',
          "94": 'ממ"ד',
          "95": 'מחסן',
          "96": 'חיות מחמד',
          "97": 'ריהוט',
          "98": 'גמיש',
          "99": 'לטווח ארוך',
          "100": 'הוסיף תמונות',
          "101": "דירות שפרסמתי",
          "102": 'מיזוג',
          "103": 'שינוי',
          "104": 'בניין',
          "105": 'מחיקה',
          "106": 'לא פורסם דירות',
        },
        "en": {
          "1": "Home Page",
          "2": "Settings",
          "3": "language:",
          "4": "English",
          "5": "Hebrew",
          "6": "Arabic",
          "7": "Login",
          "8": "Add Apartment",
          "9": "Chats",
          "10": "Calls",
          "11": "Logout",
          "12": "Username",
          "13": "Password",
          "14": "Forgot password",
          "15": "Don't have account? ",
          "16": "Sign up",
          "17": "Full name",
          "18": "Email",
          "19": "Do you have account? ",
          "20": "must enter a valid phone number",
          "21": "must enter full name",
          "22": "enter a correct email",
          "23": "password must be at least 6 letters",
          "24": "North District",
          "25": "Center District",
          "26": "Haifa District",
          "27": "Tel Aviv-Jaffa District",
          "28": "Jerusalem District",
          "29": "South District",
          "30": "Price: ",
          "31": "Rooms: ",
          "32": "Partners: ",
          "33": "Sublet: ",
          "34": "City: ",
          "35": "Street: ",
          "36": "Search",
          "37": "Clear",
          "38": "floar",
          "39": "Description",
          "40": "Kind:",
          "41": "District",
          "42": "St. number",
          "43": "Center",
          "44": "Jerusalem",
          "45": "Haifa",
          "46": "South",
          "47": "North",
          "48": "Tel Aviv-Jaffa",
          "49": "Apartment",
          "50": "House",
          "51": "Basement",
          "52": "Roof",
          "53": "Solo",
          "54": "Pint House",
          "55": "Garden House",
          "56": "Studio",
          "57": "Personal House",
          "58": "Sablet",
          "59": "partners apartment",
          "60": 'Choose from Gallery',
          "61": 'Take a Photo',
          "62": 'Favorites',
          "63": 'You must log in to perform this action.',
          "64": 'Incorect Email or Password',
          "65": 'Email is required',
          "66": 'Enter a valid email',
          "67": 'Password is required',
          "68": 'Password must be at least 6 characters long',
          "69": 'Re-enter password',
          "70": 'New password',
          "71": 'Change password',
          "72": 'Reseting password sent to the choosen email',
          "73": 'Phone number',
          "74": 'Id number',
          "75": 'Id number is required',
          "76": 'Id number must be between 9-11',
          "77": 'Phone number is required',
          "78": 'Phone number must be 10 numbers',
          "79": 'Full name is required',
          "80": 'Full name mustnt have a numbers',
          "81": 'The account already exists for that email.',
          "82": 'Reset Password',
          "83": 'Delete User',
          "84": 'User account deleted successfully.',
          "85": 'Edit information',
          "86": 'Update',
          "87": 'Share house',
          "88": 'Exclusive\nproperty',
          "89": 'Air\ncondi\ntion',
          "90": 'Bars',
          "91": 'Heater',
          "92": 'Access for\ndisabled',
          "93": 'Renovated',
          "94": 'Shelter',
          "95": 'Storage',
          "96": 'Pets',
          "97": 'Furniture',
          "98": 'flexible',
          "99": 'Long term',
          "100": 'Add photos',
          "101": "House I shared",
          "102": 'Air\ncond',
          "103": 'Edit',
          "104": 'Building',
          "105": 'Delete',
          "106": 'There is no apartments',
        }
      };
}
