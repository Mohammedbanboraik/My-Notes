import 'package:get/get.dart';

class Mylocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      // ✅ التطبيق
      "app_name": "My Notes",
      "app_description": "Your Notes App",
      "version": "Version 1.0.0",

      // ✅ الصفحات
      "home_page": "Home Page",
      "add_page": "Add Page",
      "edit_page": "Edit Page",

      // ✅ الحقول
      "note": "Note",
      "title": "Title",

      // ✅ الأزرار
      "add_note": "Add Note",
      "edit_note": "Edit Note",
      "delete_data": "Delete Data",

      // ✅ قائمة اللغة
      "English": "English",
      "Arabic": "Arabic",

      // ✅ رسائل الحذف
      "warning": "Warning",
      "delete_confirmation": "Are you sure about deleting it?",
      "confirm": "Confirm",
      "cancel": "Cancel",

      // ✅ رسائل النجاح
      "success": "Success",
      "note_deleted": "Note deleted successfully",

      // ✅ أدوات
      "delete": "Delete",
      "edit": "Edit",

      // ✅ رسائل فارغة
      "no_notes": "No notes available",

      // ✅ رسائل الخطأ
      "error": "Error",
      "something_wrong": "Something went wrong",

      // ✅ رسائل التأكيد
      "are_you_sure": "Are you sure?",
      "yes": "Yes",
      "no": "No",

      // ✅ أوامر
      "save": "Save",
      "update": "Update",
      "add": "Add",
      "search": "Search",
      "refresh": "Refresh",
      "back": "Back",
      "next": "Next",
      "done": "Done",
    },

    "ar": {
      // ✅ التطبيق
      "app_name": "ملاحظاتي",
      "app_description": "تطبيق إدارة الملاحظات",
      "version": "الإصدار 1.0.0",

      // ✅ الصفحات
      "home_page": "الصفحة الرئيسية",
      "add_page": "إضافة ملاحظة",
      "edit_page": "تعديل الملاحظة",

      // ✅ الحقول
      "note": "الملاحظة",
      "title": "العنوان",

      // ✅ الأزرار
      "add_note": "إضافة الملاحظة",
      "edit_note": "تعديل الملاحظة",
      "delete_data": "حذف البيانات",

      // ✅ قائمة اللغة
      "English": "الإنجليزية",
      "Arabic": "العربية",

      // ✅ رسائل الحذف
      "warning": "تحذير",
      "delete_confirmation": "هل أنت متأكد من حذف هذه الملاحظة؟",
      "confirm": "تأكيد",
      "cancel": "إلغاء",

      // ✅ رسائل النجاح
      "success": "نجاح",
      "note_deleted": "تم حذف الملاحظة بنجاح",

      // ✅ أدوات
      "delete": "حذف",
      "edit": "تعديل",

      // ✅ رسائل فارغة
      "no_notes": "لا توجد ملاحظات",

      // ✅ رسائل الخطأ
      "error": "خطأ",
      "something_wrong": "حدث خطأ ما",

      // ✅ رسائل التأكيد
      "are_you_sure": "هل أنت متأكد؟",
      "yes": "نعم",
      "no": "لا",

      // ✅ أوامر
      "save": "حفظ",
      "update": "تحديث",
      "add": "إضافة",
      "search": "بحث",
      "refresh": "تحديث",
      "back": "رجوع",
      "next": "التالي",
      "done": "تم",
    },
  };
}
