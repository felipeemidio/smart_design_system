import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class SmartProvider extends StatefulWidget {
  final Color? overlayColor;
  final Widget Function(BuildContext context) builder;
  const SmartProvider({
    super.key,
    required this.builder,
    this.overlayColor,
  });

  @override
  State<SmartProvider> createState() => _SmartProviderState();
}

class _SmartProviderState extends State<SmartProvider> {
  ColorScheme colors = SmartColors.deafultScheme;

  @override
  initState() {
    super.initState();
  }

  onChangeColorScheme(ColorScheme colorScheme) {
    print('ColorScheme changed');
    setState(() {
      colors = colorScheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartDesignSystem(
      colorScheme: colors,
      changeColorScheme: onChangeColorScheme,
      child: Builder(
        builder: (context) {
          return widget.builder(context);
        },
      ),
    );
  }
}
