import 'package:flutter/material.dart';

class SmartTextButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? color;
  final VoidCallback? onPressed;
  const SmartTextButton({
    super.key,
    required this.label,
    this.icon,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon != null ? Icon(icon) : null,
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: color),
      label: Text(label),
    );
  }
}
