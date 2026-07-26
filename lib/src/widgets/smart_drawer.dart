import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class SmartDrawerItem {
  final String label;
  final String route;
  final IconData icon;
  final VoidCallback onTap;
  const SmartDrawerItem({
    required this.label,
    required this.route,
    required this.icon,
    required this.onTap,
  });
}

class SmartDrawer extends StatelessWidget {
  final String? title;
  final String currentRoute;
  final List<SmartDrawerItem> menus;
  const SmartDrawer({
    super.key,
    this.title,
    required this.menus,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: SmartDesignSystem.of(context).smartTypography.title3,
                  ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: SmartDesignSystem.of(context).colorScheme.onBackground.withValues(alpha: 0.6),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            Divider(color: SmartDesignSystem.of(context).colorScheme.primary),
            Column(
              children: menus.map((menu) {
                final isActive = currentRoute == menu.route;
                return InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.of(context).pop();
                    if (!isActive) {
                      menu.onTap();
                    }
                  },
                  child: Ink(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isActive ? SmartDesignSystem.of(context).colorScheme.primaryContainer : null,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        spacing: 16,
                        children: [
                          Icon(
                            menu.icon,
                            color: isActive ? SmartDesignSystem.of(context).colorScheme.onPrimaryContainer : null,
                          ),
                          Text(
                            menu.label,
                            style: TextStyle(
                              color: isActive ? SmartDesignSystem.of(context).colorScheme.onPrimaryContainer : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
