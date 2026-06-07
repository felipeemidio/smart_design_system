import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class SmartRailMenu {
  final String? id;
  final String label;
  final IconData icon;

  final void Function()? onPressed;

  const SmartRailMenu({
    this.id,
    required this.label,
    required this.icon,
    this.onPressed,
  });
}

class SmartRail extends StatefulWidget {
  final String? initialMenu;
  final List<SmartRailMenu> menus;
  final Widget? trailing;
  final bool expanded;
  final Widget page;
  const SmartRail({
    super.key,
    required this.menus,
    required this.page,
    this.initialMenu,
    this.trailing,
    this.expanded = false,
  });

  @override
  State<SmartRail> createState() => _SmartRailState();
}

class _SmartRailState extends State<SmartRail> {
  late int seletectedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.initialMenu != null) {
      seletectedIndex = widget.menus.indexWhere((element) => element.id == widget.initialMenu);
      if (seletectedIndex == -1) {
        seletectedIndex = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          extended: widget.expanded,
          selectedIndex: seletectedIndex,
          trailing: widget.trailing,
          indicatorColor: SmartDesignSystem.of(context).colorScheme.primary,
          selectedIconTheme: IconThemeData(color: SmartDesignSystem.of(context).colorScheme.onPrimary),
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
        Expanded(child: widget.page),
      ],
    );
  }
}
