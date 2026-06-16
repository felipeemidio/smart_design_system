import 'dart:math' as math;

import 'package:flutter/material.dart';

class SmartTablePagination extends StatelessWidget {
  final int currentPage;
  final int totalItems;
  final int itemPerPage;
  final void Function(int page)? onChangePage;

  const SmartTablePagination({
    super.key,
    this.currentPage = 1,
    this.totalItems = 0,
    this.itemPerPage = 10,
    this.onChangePage,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final totalPages = (totalItems / math.max(itemPerPage, 1)).ceil();
    return SizedBox(
      height: 50,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${itemPerPage * (currentPage - 1) + (totalItems == 0 ? 0 : 1)} - ${math.min(itemPerPage * currentPage, totalItems)} de $totalItems',
          ),
          SizedBox(width: 8),
          IconButton(
            onPressed: currentPage <= 1 ? null : () => onChangePage?.call(currentPage - 1),
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: primaryColor.withValues(alpha: currentPage <= 1 ? 0.5 : 1.0),
              size: 15,
            ),
          ),
          Text('$currentPage'),
          IconButton(
            onPressed: currentPage >= totalPages ? null : () => onChangePage?.call(currentPage + 1),
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: primaryColor.withValues(alpha: currentPage >= totalPages ? 0.5 : 1.0),
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
