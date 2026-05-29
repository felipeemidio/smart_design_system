import 'package:flutter/material.dart';

class SmartTextButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  const SmartTextButton({super.key, required this.label, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon != null ? Icon(icon) : null,
      onPressed: onPressed,
      label: Text(label),
    );
  }
}
