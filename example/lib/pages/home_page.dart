import 'package:example/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_design_system/smart_design_system.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;

  _onSelect(String path) {
    context.go(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRail(
        initialMenu: GoRouterState.of(context).uri.toString(),
        expanded: isExpanded,
        page: widget.child,
        menus: [
          SmartRailMenu(
            id: '/dashboard',
            label: 'Dashboard',
            icon: Icons.dashboard,
            onPressed: () => _onSelect('/dashboard'),
          ),
          SmartRailMenu(
            id: '/buttons',
            label: 'Buttons',
            icon: Icons.smart_button_rounded,
            onPressed: () => _onSelect('/buttons'),
          ),
        ],
        trailing: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  icon: Icon(isExpanded ? Icons.chevron_left : Icons.chevron_right),
                ),
                const ThemeSwitch(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
