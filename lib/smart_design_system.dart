import 'package:flutter/material.dart';

export 'src/widgets/index.dart';
export 'src/utils/index.dart';
export 'src/styles/index.dart';

class SmartDesignSystem extends InheritedWidget {
  final ColorScheme colorScheme;
  final ValueChanged<ColorScheme> changeColorScheme;

  const SmartDesignSystem({
    super.key,
    required super.child,
    required this.colorScheme,
    required this.changeColorScheme,
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
