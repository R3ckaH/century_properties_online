import 'package:intl/intl.dart';

final pesos = NumberFormat("#,##0.00", "en_US");

String pesosConvert(double price) => pesos.format(price);
