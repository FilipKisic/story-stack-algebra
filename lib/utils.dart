import 'package:intl/intl.dart';

extension DateTimeFormatter on int {
  String toDateTimeFormat() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat('dd MMM yyyy').format(dateTime);
  }
}
