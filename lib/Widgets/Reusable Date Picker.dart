import 'package:flutter/material.dart';

class DatePickerUtil {
  static Future<void> selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // ✅ ڈیفالٹ کرنٹ تاریخ ہوگی
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), // ✅ Future Dates Allow نہیں ہوں گی
    );

    if (picked != null) {
      controller.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }
}
