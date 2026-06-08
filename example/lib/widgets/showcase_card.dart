import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class ShowcaseCard extends StatelessWidget {
  final String title;
  final Widget child;
  const ShowcaseCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(title, style: SmartDesignSystem.of(context).smartTypography.title4),
            child,
          ],
        ),
      ),
    );
  }
}
