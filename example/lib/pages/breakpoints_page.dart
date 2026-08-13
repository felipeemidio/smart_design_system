import 'package:example/widgets/page_tamplate.dart';
import 'package:example/widgets/showcase_card.dart';
import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class BreakpointsPage extends StatelessWidget {
  const BreakpointsPage({super.key});

  IconData getIcon(SmartBreakpointEnum breakpoint) {
    switch (breakpoint) {
      case SmartBreakpointEnum.small:
        return Icons.smartphone;
      case SmartBreakpointEnum.medium:
        return Icons.tablet_android;
      case SmartBreakpointEnum.large:
        return Icons.laptop;
      case SmartBreakpointEnum.huge:
        return Icons.tv;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Breakpoints (Responsiveness)',
      subtitle: 'Description of the breakpoints used throughout the system',
      child: Column(
        children: [
          ShowcaseCard(
            title: 'All Breakpoints',
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: SmartBreakpointEnum.values.map((breakpoint) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: SmartDesignSystem.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            spacing: 8,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                getIcon(breakpoint),
                                size: 20,
                                color: SmartDesignSystem.of(context).colorScheme.onPrimaryContainer,
                              ),
                              Text(
                                breakpoint.name,
                                style:
                                    SmartDesignSystem.of(
                                      context,
                                    ).smartTypography.title4.copyWith(
                                      color: SmartDesignSystem.of(context).colorScheme.onPrimaryContainer,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            'Max of ${breakpoint.value}${breakpoint == SmartBreakpointEnum.huge ? '' : 'px'}',
                            style: SmartDesignSystem.of(context).smartTypography.subtitle1.copyWith(
                              color: SmartDesignSystem.of(
                                context,
                              ).colorScheme.onPrimaryContainer.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Current breakpoint: ',
                    style: SmartDesignSystem.of(context).smartTypography.subtitle1,
                    children: [
                      TextSpan(
                        text: SmartBreakpoints.of(context).breakpoint.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: SmartDesignSystem.of(context).colorScheme.secondary,
                        ),
                      ),
                      TextSpan(
                        text: ' for ${MediaQuery.sizeOf(context).width}px',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
