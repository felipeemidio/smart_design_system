import 'package:flutter/material.dart';

class SmartResponsiveGrid extends StatelessWidget {
  final double itemWidth;
  final List<Widget> children;
  final double spacing;
  const SmartResponsiveGrid({
    super.key,
    required this.itemWidth,
    required this.children,
    this.spacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        final numOfColumns = (constraints.maxWidth / (itemWidth + spacing)).ceil();
        final numOfRows = (children.length / numOfColumns).ceil();
        return Column(
          spacing: spacing,
          children: List.generate(
            numOfRows,
            (rowIndex) {
              return Row(
                spacing: spacing,
                children: List.generate(
                  numOfColumns,
                  (columnIndex) {
                    final index = rowIndex * numOfColumns + columnIndex;
                    if (index >= children.length) return const Spacer();
                    return Expanded(
                      child: children[index],
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
