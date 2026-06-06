import 'package:example/widgets/showcase_card.dart';
import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Buttons', style: Theme.of(context).textTheme.headlineLarge),
          Text('Try to click them and check out the snackbar', style: Theme.of(context).textTheme.titleLarge),
          ShowcaseCard(
            title: 'Filled buttons',
            children: [
              SmartFilledButton(
                label: 'Filled',
                onPressed: () => SmartSnackBarUtils.success(context, message: 'Hello, from Filled Button'),
              ),
              SmartFilledButton(
                icon: Icons.bug_report,
                label: 'Filled with icon',
                onPressed: () => SmartSnackBarUtils.error(context, message: 'Hello, from Filled Button (with Icon)'),
              ),
              SmartFilledButton(
                icon: Icons.bug_report,
                label: 'Filled disabled',
                onPressed: null,
              ),
              SmartFilledButton(
                icon: Icons.bug_report,
                label: 'Filled custom',
                backgroundColor: Colors.purple,
                onPressed: () => SmartSnackBarUtils.info(context, message: 'Hello, from Custom Filled Button'),
              ),
            ],
          ),
          ShowcaseCard(
            title: 'Outlined buttons',
            children: [
              SmartOutlinedButton(
                label: 'Outlined',
                onPressed: () => SmartSnackBarUtils.success(context, message: 'Hello, from Outlined Button'),
              ),
              SmartOutlinedButton(
                icon: Icons.bug_report,
                label: 'Outlined with icon',
                onPressed: () => SmartSnackBarUtils.error(context, message: 'Hello, from Outlined Button (with Icon)'),
              ),
              SmartOutlinedButton(
                icon: Icons.bug_report,
                label: 'Outlined disabled',
                onPressed: null,
              ),
              SmartOutlinedButton(
                icon: Icons.bug_report,
                label: 'Outlined custom',
                color: Colors.purple,
                onPressed: () => SmartSnackBarUtils.info(context, message: 'Hello, from Custom Outlined Button'),
              ),
            ],
          ),
          ShowcaseCard(
            title: 'Text buttons',
            children: [
              SmartTextButton(
                label: 'Text',
                onPressed: () => SmartSnackBarUtils.success(context, message: 'Hello, from Text Button'),
              ),
              SmartTextButton(
                icon: Icons.bug_report,
                label: 'Text with icon',
                onPressed: () => SmartSnackBarUtils.error(context, message: 'Hello, from Text Button (with Icon)'),
              ),
              SmartTextButton(
                icon: Icons.bug_report,
                label: 'Text disabled',
                onPressed: null,
              ),
              SmartTextButton(
                icon: Icons.bug_report,
                label: 'Text custom',
                color: Colors.purple,
                onPressed: () => SmartSnackBarUtils.info(context, message: 'Hello, from Custom Text Button'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
