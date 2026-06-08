import 'package:example/widgets/page_tamplate.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Center(
        child: Text(
          'Welcome to our Smart Design System',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
