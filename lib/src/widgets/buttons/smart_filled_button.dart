import 'package:flutter/material.dart';

class SmartFilledButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  const SmartFilledButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: icon != null ? Icon(icon) : null,
      onPressed: onPressed,
      style: FilledButton.styleFrom(backgroundColor: backgroundColor),
      label: Text(label),
    );
  }
}
