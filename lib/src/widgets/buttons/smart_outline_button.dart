import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class SmartOutlinedButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? color;
  final VoidCallback? onPressed;
  const SmartOutlinedButton({
    super.key,
    required this.label,
    this.icon,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: icon != null ? Icon(icon) : null,
      onPressed: onPressed,
      style: ButtonStyle(
        // side: OutlinedBorder.side,
        side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          return BorderSide(
            color: color ?? SmartDesignSystem.of(context).colorScheme.primary,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          return color;
        }),
      ),
      label: Text(label),
    );
  }
}
