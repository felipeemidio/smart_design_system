import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool _active = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _active = Theme.of(context).colorScheme.brightness == Brightness.dark;
    });
  }

  _onToggle(BuildContext context, bool value) {
    setState(() {
      _active = value;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SmartDesignSystem.of(
        context,
      ).changeColorScheme(value ? defaultDarkSmartColors : defaultLightSmartColors);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _active,
      activeColor: Colors.blueGrey,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (value) => _onToggle(context, value),
    );
  }
}
