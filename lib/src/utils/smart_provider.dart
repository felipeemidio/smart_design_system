import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';
import 'package:smart_design_system/src/styles/default_smart_colors.dart';

class SmartProvider extends StatefulWidget {
  final Brightness defaultBrightness;
  final Widget Function(BuildContext context) builder;
  const SmartProvider({
    super.key,
    required this.builder,
    this.defaultBrightness = Brightness.light,
  });

  @override
  State<SmartProvider> createState() => _SmartProviderState();
}

class _SmartProviderState extends State<SmartProvider> {
  late SmartColors colors;

  @override
  initState() {
    super.initState();
    colors = widget.defaultBrightness == Brightness.light ? defaultLightSmartColors : defaultDarkSmartColors;
  }

  onChangeColorScheme(SmartColors newSmartColors) {
    print('SmartColors changed');
    setState(() {
      colors = newSmartColors;
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
