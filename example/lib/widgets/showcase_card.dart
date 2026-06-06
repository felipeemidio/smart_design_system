import 'package:flutter/material.dart';

class ShowcaseCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ShowcaseCard({super.key, required this.title, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
