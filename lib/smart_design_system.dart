import 'package:flutter/material.dart';
import 'package:smart_design_system/src/styles/index.dart';
import 'package:smart_design_system/src/styles/smart_typography.dart';

export 'src/widgets/index.dart';
export 'src/utils/index.dart';
export 'src/styles/index.dart';

class SmartDesignSystem extends InheritedWidget {
  final SmartColors colorScheme;
  final SmartTypography smartTypography;
  final ValueChanged<SmartColors> changeColorScheme;

  const SmartDesignSystem({
    super.key,
    required super.child,
    required this.colorScheme,
    required this.changeColorScheme,
    required this.smartTypography,
  });

  static SmartDesignSystem of(BuildContext context) {
    final SmartDesignSystem? result = context.dependOnInheritedWidgetOfExactType<SmartDesignSystem>();
    assert(result != null, 'No SmartDesignSystem found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SmartDesignSystem oldWidget) {
    final result = colorScheme != oldWidget.colorScheme;
    return result;
  }
}
