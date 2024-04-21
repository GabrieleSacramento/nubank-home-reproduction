import 'package:intl/intl.dart';

extension NumberFormatter on num {
  String toCurrency() {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(this);
  }
}
