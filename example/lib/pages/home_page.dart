import 'package:example/pages/buttons_page.dart';
import 'package:example/pages/dashboard_page.dart';
import 'package:example/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isExpanded = false;

  _onSelect() {
    setState(() {
      _selectedIndex = _selectedIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRail(
        expanded: isExpanded,
        menus: [
          SmartRailMenu(
            label: 'Dashboard',
            icon: Icons.dashboard,
            onPressed: _onSelect,
            page: DashboardPage(),
          ),
          SmartRailMenu(
            label: 'Buttons',
            icon: Icons.smart_button_rounded,
            onPressed: _onSelect,
            page: ButtonsPage(),
          ),
          SmartRailMenu(label: 'Profile', icon: Icons.person, onPressed: _onSelect),
          SmartRailMenu(label: 'Logout', icon: Icons.logout, onPressed: _onSelect),
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
