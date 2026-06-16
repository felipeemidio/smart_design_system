import 'package:flutter/material.dart';
import 'package:smart_design_system/src/widgets/table/smart_table.dart';

class SmartTableActionWrappedButton<T> extends StatelessWidget {
  final List<SmartTableAction<T>> actions;
  final T data;
  const SmartTableActionWrappedButton({
    super.key,
    required this.actions,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      tooltip: 'Ações',
      onSelected: (String value) {
        final actionIndex = actions.indexWhere((a) => a.tooltip == value);
        if (actionIndex != -1) {
          actions[actionIndex].onTap?.call(data);
        }
      },
      itemBuilder: (BuildContext context) => actions.map((e) {
        final bool isDisabled = e.onTap == null || (e.disabled?.call(data) ?? false);
        return PopupMenuItem<String>(
          value: e.tooltip,
          enabled: !isDisabled,
          child: Row(
            spacing: 8,
            children: [
              Icon(e.icon, color: e.color ?? Theme.of(context).colorScheme.primary, size: 20),
              Text(e.tooltip),
            ],
          ),
        );
      }).toList(),
    );
  }
}
