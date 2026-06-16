import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_design_system/src/widgets/table/smart_table_action_button.dart';
import 'package:smart_design_system/src/widgets/table/smart_table_action_wrapped_button.dart';
import 'package:smart_design_system/src/widgets/table/smart_table_pagination.dart';

class SmartTablePaginationData {
  final int totalItems;
  final int? itemsPerPage;
  final int currentPage;
  final void Function(int page)? onPageChanged;
  final AlignmentGeometry alignment;

  const SmartTablePaginationData({
    required this.totalItems,
    required this.itemsPerPage,
    required this.currentPage,
    this.onPageChanged,
    this.alignment = Alignment.centerRight,
  });
}

class SmartTableColumn<T> {
  final String name;
  final String? tooltip;
  final String Function(T data)? cellTooptip;
  final TableColumnWidth? tableWidth;
  final String Function(T data)? builder;
  final Widget Function(T data)? customCellBuilder;
  final Widget Function()? headerWidgetBuilder;

  const SmartTableColumn({
    required this.name,
    this.tooltip,
    this.builder,
    this.customCellBuilder,
    this.headerWidgetBuilder,
    this.tableWidth,
    this.cellTooptip,
  }) : assert(
         builder != null || customCellBuilder != null,
         'Either builder or widgetBuilder must be provided',
       );
}

class SmartTableAction<T> {
  final String tooltip;
  final IconData icon;
  final Color? color;
  final bool Function(T data)? disabled;
  final void Function(T data)? onTap;

  const SmartTableAction({
    required this.tooltip,
    required this.icon,
    this.color,
    this.disabled,
    this.onTap,
  });
}

class SmartTable<T> extends StatefulWidget {
  final List<T> data;
  final bool loading;
  final List<SmartTableColumn<T>> columns;
  final double scrollbarThickness;
  final Radius? scrollbarRadius;
  final Color? rowColor;
  final bool hasRowSelection;
  final void Function(bool? value)? onSelectAll;
  final void Function(T value)? onPressedRow;
  final double? dataRowMinHeight;
  final double? dataRowMaxHeight;
  final bool showBottomBorder;
  final SmartTablePaginationData? pagination;
  final List<SmartTableAction<T>> actions;
  final bool wrapAction;
  final String emptyText;

  const SmartTable({
    super.key,
    required this.columns,
    required this.data,
    this.scrollbarThickness = 8.0,
    this.scrollbarRadius,
    this.loading = false,
    this.hasRowSelection = false,
    this.dataRowMaxHeight,
    this.dataRowMinHeight,
    this.onPressedRow,
    this.showBottomBorder = false,
    this.onSelectAll,
    this.rowColor,
    this.pagination,
    this.actions = const [],
    this.wrapAction = true,
    this.emptyText = 'Nenhum registro encontrado.',
  });

  @override
  State<SmartTable<T>> createState() => _SmartTableState<T>();
}

class _SmartTableState<T> extends State<SmartTable<T>> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentColumns = widget.columns;
    if (widget.actions.isNotEmpty) {
      currentColumns.add(
        SmartTableColumn<T>(
          name: 'Ações',
          tableWidth: widget.wrapAction ? const FixedColumnWidth(80) : null,
          customCellBuilder: (data) {
            if (widget.wrapAction) {
              return SmartTableActionWrappedButton(
                actions: widget.actions,
                data: data,
              );
            }
            return Row(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: widget.actions.map((action) {
                return CustomTableActionButton<T>(
                  action: action,
                  data: data,
                );
              }).toList(),
            );
          },
        ),
      );
    }
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Theme(
              data: theme.copyWith(
                scrollbarTheme: ScrollbarThemeData(
                  thickness: WidgetStateProperty.all(widget.scrollbarThickness),
                  radius: widget.scrollbarRadius,
                  thumbVisibility: WidgetStateProperty.all(true),
                  thumbColor: WidgetStatePropertyAll(theme.colorScheme.primaryContainer),
                ),
              ),
              child: Scrollbar(
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: Skeletonizer(
                      enabled: widget.loading,
                      child: DataTable(
                        dividerThickness: 0.1,
                        headingRowColor: WidgetStateProperty.all(theme.colorScheme.primaryContainer),
                        dataRowColor: WidgetStateProperty.resolveWith(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
                              return theme.colorScheme.primaryContainer;
                            }
                            return widget.rowColor;
                          },
                        ),
                        showCheckboxColumn: widget.hasRowSelection,
                        onSelectAll: widget.hasRowSelection ? widget.onSelectAll : null,
                        dataRowMinHeight: widget.dataRowMinHeight,
                        dataRowMaxHeight: widget.dataRowMaxHeight,
                        showBottomBorder: widget.showBottomBorder,
                        columns: currentColumns.map(
                          (column) {
                            return DataColumn(
                              columnWidth: column.tableWidth,
                              tooltip: column.tooltip ?? column.name,
                              label: Flexible(
                                child: Text(
                                  column.name,
                                  overflow: TextOverflow.visible,
                                  maxLines: 1,
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        rows: widget.data.map((item) {
                          return DataRow(
                            onSelectChanged: widget.onPressedRow != null ? (value) => widget.onPressedRow!(item) : null,
                            cells: currentColumns.map((column) {
                              return DataCell(
                                column.customCellBuilder != null
                                    ? column.customCellBuilder!(item)
                                    : Tooltip(
                                        message: column.cellTooptip?.call(item) ?? '',
                                        child: Text(
                                          column.builder != null ? column.builder!(item) : '-',
                                          style: const TextStyle(fontWeight: FontWeight.w400),
                                        ),
                                      ),
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (!widget.loading && widget.data.isEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.emptyText,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
            if (widget.pagination != null)
              Align(
                alignment: widget.pagination!.alignment,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SmartTablePagination(
                    currentPage: widget.pagination!.currentPage,
                    itemPerPage: widget.pagination!.itemsPerPage ?? 10,
                    totalItems: widget.pagination!.totalItems,
                    onChangePage: widget.pagination!.onPageChanged,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
