import 'package:intl/intl.dart';

extension NumberExtension on num {
  String get format => NumberFormat.decimalPattern().format(this);
}
