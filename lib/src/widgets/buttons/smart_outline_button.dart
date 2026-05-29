import 'package:flutter/material.dart';

class SmartOutlinedButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  const SmartOutlinedButton({super.key, required this.label, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: icon != null ? Icon(icon) : null,
      onPressed: onPressed,
      label: Text(label),
    );
  }
}
