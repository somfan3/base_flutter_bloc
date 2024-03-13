import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtention on DateTime {
  String format({String pattern = "EEE, dd MMM, yyyy"}) {
    return DateFormat(pattern).format(this);
  }

  TimeOfDay get toTimeOfDay => TimeOfDay(hour: hour, minute: minute);

  DateTime copyWith(
      {int? year,
      int? month,
      int? day,
      int? hour,
      int? minute,
      int? second,
      int? millisecond,
      int? microsecond}) {
    return DateTime(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
        microsecond ?? this.microsecond);
  }

  DateTime copyDateWithoutTime(DateTime date) {
    return DateTime(date.year, date.month, date.day, hour, minute, second,
        millisecond, microsecond);
  }

  DateTime get copyWithoutTime => DateTime(year, month, day);

  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0, 23, 59, 0, 0, 0);

  DateTime get firstDayOfMonth => DateTime(year, month, 1, 0, 0, 0, 0, 0);

  bool isAfterOrEqual(DateTime other) {
    return DateUtils.isSameDay(other, this) || isAfter(other);
  }

  bool isBeforeOrEqual(DateTime other) {
    return DateUtils.isSameDay(other, this) || isBefore(other);
  }

  bool isBetween(DateTime from, DateTime to) {
    return isAfterOrEqual(from) && isBeforeOrEqual(to);
  }

  bool isBetweenExclusive({required DateTime from, required DateTime to}) {
    return isAfter(from) && isBefore(to);
  }
}
