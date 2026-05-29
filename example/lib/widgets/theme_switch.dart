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

  _onToggle(_) {
    setState(() {
      _active = !_active;
      SmartDesignSystem.of(
        context,
      ).changeColorScheme(_active ? SmartColors.darkMainScheme : SmartColors.lightMainScheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _active,
      activeColor: Colors.blueGrey,
      onChanged: _onToggle,
    );
  }
}
