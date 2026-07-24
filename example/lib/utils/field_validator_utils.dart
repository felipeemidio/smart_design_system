import 'package:flutter/material.dart';

abstract class FieldValidatorUtils {
  const FieldValidatorUtils._();

  static FormFieldValidator<String> multiple(List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  static FormFieldValidator<String> isRequired({String? message}) {
    return (value) {
      if (value?.isEmpty ?? true) return message ?? 'Required field';
      return null;
    };
  }
}
