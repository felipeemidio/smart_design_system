import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_design_system/smart_design_system.dart';

class SmartTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final bool obscureText;
  final int? maxLines;
  final void Function(String)? onChanged;
  final bool readOnly;
  final bool disabled;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Color? fillColor;
  final Color? focusColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const SmartTextFormField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.maxLines,
    this.onChanged,
    this.validator,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.fillColor,
    this.focusColor,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.disabled = false,
    this.obscureText = false,
  });

  @override
  State<SmartTextFormField> createState() => _SmartTextFormFieldState();
}

class _SmartTextFormFieldState extends State<SmartTextFormField> {
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _hasFocusNotifier = ValueNotifier(false);

  _listenFocus() {
    if (_focusNode.hasFocus != _hasFocusNotifier.value) {
      _hasFocusNotifier.value = _focusNode.hasFocus;
    }
  }

  Color? _getLabelColor(BuildContext context, bool hasFocus) {
    if (hasFocus) {
      return widget.focusColor ?? SmartDesignSystem.of(context).colorScheme.primary;
    }
    return widget.disabled ? Theme.of(context).disabledColor : null;
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(_listenFocus);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _hasFocusNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: ValueListenableBuilder(
              valueListenable: _hasFocusNotifier,
              builder: (context, hasFocus, _) {
                return Text(
                  widget.label!,
                  style:
                      SmartDesignSystem.of(
                        context,
                      ).smartTypography.label.copyWith(
                        color: _getLabelColor(context, hasFocus),
                        fontWeight: hasFocus ? FontWeight.w600 : null,
                      ),
                );
              },
            ),
          ),
        TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: widget.focusColor == null
                ? null
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: widget.focusColor!, width: 2),
                  ),
            filled: true,
            fillColor: widget.fillColor ?? Colors.black12,
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: widget.disabled ? 0.3 : 0.6),
            ),
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon,
            prefix: widget.prefix,
            prefixIcon: widget.prefixIcon,
          ),
          validator: widget.validator,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          enabled: !widget.disabled,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
        ),
      ],
    );
  }
}
