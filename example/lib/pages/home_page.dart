import 'package:example/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_design_system/smart_design_system.dart';

class RouteMenu {
  final String route;
  final String label;
  final IconData icon;

  const RouteMenu({
    required this.route,
    required this.label,
    required this.icon,
  });
}

class HomePage extends StatefulWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;

  final menus = <RouteMenu>[
    RouteMenu(
      route: '/dashboard',
      label: 'Dashboard',
      icon: Icons.dashboard,
    ),
    RouteMenu(
      route: '/colors',
      label: 'Colors',
      icon: Icons.color_lens,
    ),
    RouteMenu(
      route: '/typography',
      label: 'Typography',
      icon: Icons.text_fields,
    ),
    RouteMenu(
      route: '/buttons',
      label: 'Buttons',
      icon: Icons.smart_button_rounded,
    ),
    RouteMenu(
      route: '/text-fields',
      label: 'Text Fields',
      icon: Icons.format_shapes,
    ),
  ];

  void _onSelect(String path) {
    context.go(path);
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width <= 600;
    if (isSmallScreen) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Smart DS'),
          actionsPadding: EdgeInsets.only(right: 16),
          actions: [
            const ThemeSwitch(),
          ],
        ),
        drawer: SmartDrawer(
          currentRoute: GoRouterState.of(context).uri.toString(),
          title: 'Menu',
          menus: menus.map((menu) {
            return SmartDrawerItem(
              route: menu.route,
              label: menu.label,
              icon: menu.icon,
              onTap: () => _onSelect(menu.route),
            );
          }).toList(),
        ),
        body: widget.child,
      );
    }

    return Scaffold(
      body: SmartRail(
        initialMenu: GoRouterState.of(context).uri.toString(),
        expanded: isExpanded,
        page: widget.child,
        menus: menus.map((menu) {
          return SmartRailMenu(
            id: menu.route,
            label: menu.label,
            icon: menu.icon,
            onPressed: () => _onSelect(menu.route),
          );
        }).toList(),
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
