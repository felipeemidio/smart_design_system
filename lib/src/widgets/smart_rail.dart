import 'package:flutter/material.dart';

class SmartRailMenu {
  final String label;
  final IconData icon;
  final Widget? page;

  final void Function()? onPressed;

  const SmartRailMenu({
    required this.label,
    required this.icon,
    this.page,
    this.onPressed,
  });
}

class SmartRail extends StatefulWidget {
  final List<SmartRailMenu> menus;
  final Widget? trailing;
  final bool expanded;
  const SmartRail({
    super.key,
    required this.menus,
    this.trailing,
    this.expanded = false,
  });

  @override
  State<SmartRail> createState() => _SmartRailState();
}

class _SmartRailState extends State<SmartRail> {
  int seletectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          extended: widget.expanded,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          selectedIndex: seletectedIndex,
          trailing: widget.trailing,
          destinations: widget.menus
              .map((e) => NavigationRailDestination(icon: Icon(e.icon), label: Text(e.label)))
              .toList(),
          onDestinationSelected: (index) {
            widget.menus[index].onPressed?.call();
            setState(() {
              seletectedIndex = index;
            });
          },
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: widget.menus[seletectedIndex].page ?? const Placeholder()),
      ],
    );
  }
}
