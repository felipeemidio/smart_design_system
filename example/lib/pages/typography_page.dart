import 'package:example/widgets/page_tamplate.dart';
import 'package:example/widgets/showcase_card.dart';
import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  String _buildFontText(String name, TextStyle style, String defaultFontFamily) {
    return '$name ${style.fontFamily ?? defaultFontFamily} ${style.fontSize}px w${style.fontWeight?.value} height:${style.height}';
  }

  @override
  Widget build(BuildContext context) {
    final smartTypography = SmartDesignSystem.of(context).smartTypography;
    final defaultFontFamily = Theme.of(context).textTheme.bodyLarge?.fontFamily ?? '-';
    return PageTemplate(
      title: 'Typography',
      subtitle: 'Description of the texts used throughout the system',
      child: ShowcaseCard(
        title: 'Styles',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              _buildFontText('Title1', smartTypography.title1, defaultFontFamily),
              style: smartTypography.title1,
            ),
            Text(
              _buildFontText('Title2', smartTypography.title2, defaultFontFamily),
              style: smartTypography.title2,
            ),
            Text(
              _buildFontText('Title3', smartTypography.title3, defaultFontFamily),
              style: smartTypography.title3,
            ),
            Text(
              _buildFontText('Title4', smartTypography.title4, defaultFontFamily),
              style: smartTypography.title4,
            ),
            Text(
              _buildFontText('Subtitle1', smartTypography.subtitle1, defaultFontFamily),
              style: smartTypography.subtitle1,
            ),
            Text(
              _buildFontText('Subtitle2', smartTypography.subtitle2, defaultFontFamily),
              style: smartTypography.subtitle2,
            ),
            Text(
              _buildFontText('Body1', smartTypography.body1, defaultFontFamily),
              style: smartTypography.body1,
            ),
            Text(
              _buildFontText('Body2', smartTypography.body2, defaultFontFamily),
              style: smartTypography.body2,
            ),
            Text(
              _buildFontText('Button', smartTypography.button, defaultFontFamily),
              style: smartTypography.button,
            ),
            Text(
              _buildFontText('label', smartTypography.label, defaultFontFamily),
              style: smartTypography.label,
            ),
          ],
        ),
      ),
    );
  }
}
