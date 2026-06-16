import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  const ColorCard({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: TextStyle(color: textColor),
          ),
          Text(
            '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
            textAlign: TextAlign.end,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
