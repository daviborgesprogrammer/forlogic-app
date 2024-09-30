import 'package:brasil_fields/brasil_fields.dart';

extension FormatterDouble on double {
  String get currencyPTBR {
    return UtilBrasilFields.obterReal(this);
  }
}
