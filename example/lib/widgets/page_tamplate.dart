import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class PageTemplate extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget child;
  const PageTemplate({super.key, this.title, this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (title != null) Text(title!, style: SmartDesignSystem.of(context).smartTypography.title1),
            if (subtitle != null)
              Text(
                subtitle!,
                style: SmartDesignSystem.of(context).smartTypography.subtitle1,
              ),
            child,
          ],
        ),
      ),
    );
  }
}
