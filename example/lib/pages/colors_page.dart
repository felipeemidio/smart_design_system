import 'package:example/widgets/color_card.dart';
import 'package:example/widgets/page_tamplate.dart';
import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = SmartDesignSystem.of(context).colorScheme;

    return PageTemplate(
      title: 'Colors',
      subtitle: 'Colors used throughout the system',
      child: SmartResponsiveGrid(
        itemWidth: 250,
        spacing: 8,
        children: [
          ColorCard(
            label: 'Primary',
            color: colorScheme.primary,
            textColor: colorScheme.onPrimary,
          ),
          ColorCard(
            label: 'OnPrimary',
            color: colorScheme.onPrimary,
            textColor: colorScheme.primary,
          ),
          ColorCard(
            label: 'PrimaryContainer',
            color: colorScheme.primaryContainer,
            textColor: colorScheme.onPrimaryContainer,
          ),
          ColorCard(
            label: 'OnPrimaryContainer',
            color: colorScheme.onPrimaryContainer,
            textColor: colorScheme.primaryContainer,
          ),
          ColorCard(
            label: 'Secondary',
            color: colorScheme.secondary,
            textColor: colorScheme.onSecondary,
          ),
          ColorCard(
            label: 'OnSecondary',
            color: colorScheme.onSecondary,
            textColor: colorScheme.secondary,
          ),
          ColorCard(
            label: 'SecondaryContainer',
            color: colorScheme.secondaryContainer,
            textColor: colorScheme.onSecondaryContainer,
          ),
          ColorCard(
            label: 'OnSecondaryContainer',
            color: colorScheme.onSecondaryContainer,
            textColor: colorScheme.secondaryContainer,
          ),
          ColorCard(
            label: 'Info',
            color: colorScheme.info,
            textColor: colorScheme.onInfo,
          ),
          ColorCard(
            label: 'OnInfo',
            color: colorScheme.onInfo,
            textColor: colorScheme.info,
          ),
          ColorCard(
            label: 'InfoContainer',
            color: colorScheme.infoContainer,
            textColor: colorScheme.onInfoContainer,
          ),
          ColorCard(
            label: 'OnInfoContainer',
            color: colorScheme.onInfoContainer,
            textColor: colorScheme.infoContainer,
          ),
          ColorCard(
            label: 'Success',
            color: colorScheme.success,
            textColor: colorScheme.onSuccess,
          ),
          ColorCard(
            label: 'OnSuccess',
            color: colorScheme.onSuccess,
            textColor: colorScheme.success,
          ),
          ColorCard(
            label: 'SuccessContainer',
            color: colorScheme.successContainer,
            textColor: colorScheme.onSuccessContainer,
          ),
          ColorCard(
            label: 'OnSuccessContainer',
            color: colorScheme.onSuccessContainer,
            textColor: colorScheme.successContainer,
          ),
          ColorCard(
            label: 'Warning',
            color: colorScheme.warning,
            textColor: colorScheme.onWarning,
          ),
          ColorCard(
            label: 'OnWarning',
            color: colorScheme.onWarning,
            textColor: colorScheme.warning,
          ),
          ColorCard(
            label: 'WarningContainer',
            color: colorScheme.warningContainer,
            textColor: colorScheme.onWarningContainer,
          ),
          ColorCard(
            label: 'OnWarningContainer',
            color: colorScheme.onWarningContainer,
            textColor: colorScheme.warningContainer,
          ),
          ColorCard(
            label: 'Error',
            color: colorScheme.error,
            textColor: colorScheme.onError,
          ),
          ColorCard(
            label: 'OnError',
            color: colorScheme.onError,
            textColor: colorScheme.error,
          ),
          ColorCard(
            label: 'ErrorContainer',
            color: colorScheme.errorContainer,
            textColor: colorScheme.onErrorContainer,
          ),
          ColorCard(
            label: 'OnErrorContainer',
            color: colorScheme.onErrorContainer,
            textColor: colorScheme.errorContainer,
          ),
          ColorCard(
            label: 'Background',
            color: colorScheme.background,
            textColor: colorScheme.onBackground,
          ),
          ColorCard(
            label: 'OnBackground',
            color: colorScheme.onBackground,
            textColor: colorScheme.background,
          ),
          ColorCard(
            label: 'Card Low',
            color: colorScheme.cardLow,
            textColor: colorScheme.onBackground,
          ),
          ColorCard(
            label: 'Card',
            color: colorScheme.card,
            textColor: colorScheme.onBackground,
          ),
          ColorCard(
            label: 'Card High',
            color: colorScheme.cardHigh,
            textColor: colorScheme.onBackground,
          ),
          ColorCard(
            label: 'Disabled',
            color: colorScheme.disabled,
            textColor: colorScheme.onDisabled,
          ),
          ColorCard(
            label: 'OnDisabled',
            color: colorScheme.onDisabled,
            textColor: colorScheme.disabled,
          ),
          ColorCard(
            label: 'Outline',
            color: colorScheme.outline,
            textColor: colorScheme.background,
          ),
        ],
      ),
    );
  }
}
