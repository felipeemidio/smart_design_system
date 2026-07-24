import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:smart_design_system/src/widgets/text_form_fields/smart_text_form_field.dart';

enum SmartTextFieldCurrency {
  dollar('\$', 'en_US'),
  euro('€', 'de_DE'),
  real('R\$', 'pt_BR');

  final String symbol;
  final String locale;

  const SmartTextFieldCurrency(
    this.symbol,
    this.locale,
  );
}

class SmartCurrencyTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool readOnly;
  final bool disabled;
  final TextEditingController? controller;
  final Widget? prefix;
  final Color? fillColor;
  final Color? focusColor;
  final FormFieldValidator<String>? validator;
  final SmartTextFieldCurrency currency;

  const SmartCurrencyTextFormField({
    super.key,
    this.controller,
    this.prefix,
    this.validator,
    this.label,
    this.hint,
    this.fillColor,
    this.focusColor,
    this.readOnly = false,
    this.disabled = false,
    this.currency = SmartTextFieldCurrency.dollar,
  });

  @override
  Widget build(BuildContext context) {
    return SmartTextFormField(
      controller: controller,
      validator: validator,
      hint: hint,
      label: label,
      readOnly: readOnly,
      fillColor: fillColor,
      focusColor: focusColor,
      disabled: disabled,
      prefix: Text(
        '${currency.symbol} ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      inputFormatters: [CurrencyTextInputFormatter.currency(locale: currency.locale, symbol: '')],
    );
  }
}
