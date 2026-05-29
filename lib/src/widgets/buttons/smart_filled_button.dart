import 'package:flutter/material.dart';

class SmartFilledButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  const SmartFilledButton({super.key, required this.label, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: icon != null ? Icon(icon) : null,
      onPressed: onPressed,
      label: Text(label),
    );
  }
}
