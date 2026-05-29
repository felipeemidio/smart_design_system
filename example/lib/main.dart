import 'package:example/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartProvider(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Design System',
        theme: ThemeData(colorScheme: SmartDesignSystem.of(context).colorScheme),
        home: const HomePage(),
      ),
    );
  }
}
