import 'package:intl/intl.dart';

final currencyFormatter = new NumberFormat("#.###");
final idrFormatter = new NumberFormat("Rp #.###");

extension ExtendedNum on num {
  String idrFormat() {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      name: 'Rp ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(this);
  }
}
