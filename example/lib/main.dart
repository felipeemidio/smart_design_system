import 'package:example/pages/buttons_page.dart';
import 'package:example/pages/dashboard_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/utils/animation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_design_system/smart_design_system.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/dashboard',
  redirect: (BuildContext context, GoRouterState routerState) {
    if (routerState.path == '/') {
      return '/dashboard';
    }
    return null;
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          pageBuilder: (context, state) => buildCustomTransitionPage(
            state: state,
            child: const DashboardPage(), // Use const if possible
          ),
        ),
        GoRoute(
          path: '/buttons',
          pageBuilder: (context, state) => buildCustomTransitionPage(
            state: state,
            child: const ButtonsPage(), // Use const if possible
          ),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartProvider(
      builder: (context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Smart Design System',
        theme: ThemeData(
          colorScheme: SmartDesignSystem.of(context).colorScheme,
        ),
        // home: const HomePage(),
        routerConfig: _router,
      ),
    );
  }
}
