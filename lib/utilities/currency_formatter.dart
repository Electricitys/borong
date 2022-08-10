import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(String value) {
    if (value.isEmpty) return "";
    late double? parsed;
    try {
      parsed = double.parse(value);
    } catch (err) {
      return "Invalid Price";
    }
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
    ).format(parsed);
  }
}
