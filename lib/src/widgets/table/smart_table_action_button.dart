import 'package:flutter/material.dart';
import 'package:smart_design_system/src/widgets/table/smart_table.dart';

class CustomTableActionButton<T> extends StatelessWidget {
  final SmartTableAction<T> action;
  final T data;
  const CustomTableActionButton({super.key, required this.action, required this.data});

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = action.onTap == null || (action.disabled?.call(data) ?? false);
    return GestureDetector(
      onTap: isDisabled ? () {} : null,
      behavior: HitTestBehavior.opaque,
      child: IconButton(
        icon: Icon(
          action.icon,
          size: 24,
        ),
        color: action.color ?? Theme.of(context).colorScheme.primary,
        tooltip: action.tooltip,
        onPressed: isDisabled ? null : () => action.onTap!(data),
      ),
    );
  }
}
