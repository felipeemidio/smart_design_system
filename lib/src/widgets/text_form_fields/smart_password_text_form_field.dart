import 'package:flutter/material.dart';
import 'package:smart_design_system/src/widgets/text_form_fields/smart_text_form_field.dart';

class SmartPasswordTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final bool readOnly;
  final bool disabled;
  final Color? fillColor;
  final Color? focusColor;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const SmartPasswordTextFormField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.fillColor,
    this.focusColor,
    this.readOnly = false,
    this.disabled = false,
  });

  @override
  State<SmartPasswordTextFormField> createState() => _SmartPasswordTextFormFieldState();
}

class _SmartPasswordTextFormFieldState extends State<SmartPasswordTextFormField> {
  bool _isObscure = true;

  _onToggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartTextFormField(
      controller: widget.controller,
      label: widget.label,
      hint: widget.hint,
      obscureText: _isObscure,
      maxLines: 1,
      fillColor: widget.fillColor,
      focusColor: widget.focusColor,
      validator: widget.validator,
      readOnly: widget.readOnly,
      disabled: widget.disabled,
      suffixIcon: IconButton(
        onPressed: widget.readOnly ? null : _onToggleVisibility,
        icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
