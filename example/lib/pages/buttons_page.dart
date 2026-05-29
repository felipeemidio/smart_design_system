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
          Text('Filled Buttons', style: Theme.of(context).textTheme.titleSmall),
          Wrap(
            spacing: 8,
            children: [
              SmartFilledButton(
                label: 'Filled',
                onPressed: () => SmartSnackBarUtils.info(context, message: 'Hello, from Filled Button'),
              ),
              SmartFilledButton(
                icon: Icons.bug_report,
                label: 'Filled',
                onPressed: () => SmartSnackBarUtils.info(context, message: 'Hello, from Filled Button (with Image)'),
              ),
            ],
          ),

          SmartOutlinedButton(
            label: 'Outlined',
            onPressed: () => SmartSnackBarUtils.success(context, message: 'Hello, from Outlined Button'),
          ),
          SmartOutlinedButton(
            icon: Icons.bug_report,
            label: 'Outlined',
            onPressed: () => SmartSnackBarUtils.success(context, message: 'Hello, from Outlined Button (with Image)'),
          ),
          SmartTextButton(
            label: 'Text',
            onPressed: () => SmartSnackBarUtils.error(context, message: 'Hello, from Text Button'),
          ),
          SmartTextButton(
            icon: Icons.bug_report,
            label: 'Text',
            onPressed: () => SmartSnackBarUtils.error(context, message: 'Hello, from Text Button (with Image)'),
          ),
        ],
      ),
    );
  }
}
