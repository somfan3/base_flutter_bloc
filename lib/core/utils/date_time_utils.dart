import 'package:flutter/material.dart';

class DateTimeUtils {
  static Future<DateTime?> pickedDate(BuildContext context,
      {DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2090),
    );
  }
}
