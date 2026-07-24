import 'package:example/utils/field_validator_utils.dart';
import 'package:example/widgets/page_tamplate.dart';
import 'package:example/widgets/showcase_card.dart';
import 'package:flutter/material.dart';
import 'package:smart_design_system/smart_design_system.dart';

class TextFormFieldsPage extends StatefulWidget {
  const TextFormFieldsPage({super.key});

  @override
  State<TextFormFieldsPage> createState() => _TextFormFieldsPageState();
}

class _TextFormFieldsPageState extends State<TextFormFieldsPage> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  _onSubmit(GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Text Form Fields',
      child: Column(
        spacing: 16,
        children: [
          ShowcaseCard(
            title: 'Default Form Field',
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SmartResponsiveGrid(
                    itemWidth: 400,
                    spacing: 16,
                    children: [
                      SmartTextFormField(
                        hint: 'Hint text...',
                        label: 'Default',
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                      SmartTextFormField(
                        hint: 'Hint text...',
                        label: 'Custom apperance',
                        focusColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        fillColor: Theme.of(context).colorScheme.secondaryContainer,
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                      SmartTextFormField(
                        hint: 'Hint text...',
                        label: 'Read only',
                        readOnly: true,
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                      SmartTextFormField(
                        hint: 'Hint text...',
                        label: 'Disabled',
                        disabled: true,
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SmartFilledButton(label: 'Submit', onPressed: () => _onSubmit(_formKey)),
                  ),
                ],
              ),
            ),
          ),
          ShowcaseCard(
            title: 'Currency Form Field',
            child: Form(
              key: _formKey2,
              child: Column(
                children: [
                  SmartResponsiveGrid(
                    itemWidth: 400,
                    spacing: 16,
                    children: [
                      SmartCurrencyTextFormField(
                        hint: '0.00',
                        label: 'Default',
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                      SmartCurrencyTextFormField(
                        hint: '0,00',
                        label: 'Custom apperance',
                        currency: SmartTextFieldCurrency.real,
                        focusColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        fillColor: Theme.of(context).colorScheme.secondaryContainer,
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                      SmartCurrencyTextFormField(
                        hint: '0.00',
                        label: 'Read only',
                        readOnly: true,
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                      SmartCurrencyTextFormField(
                        hint: '0.00',
                        label: 'Disabled',
                        disabled: true,
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SmartFilledButton(label: 'Submit', onPressed: () => _onSubmit(_formKey2)),
                  ),
                ],
              ),
            ),
          ),
          ShowcaseCard(
            title: 'Password Form Field',
            child: Form(
              key: _formKey3,
              child: Column(
                children: [
                  SmartResponsiveGrid(
                    itemWidth: 400,
                    spacing: 16,
                    children: [
                      SmartPasswordTextFormField(
                        hint: 'Hint text...',
                        label: 'Default',
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                      SmartPasswordTextFormField(
                        hint: 'Hint text...',
                        label: 'Custom apperance',
                        focusColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        fillColor: Theme.of(context).colorScheme.secondaryContainer,
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                      SmartPasswordTextFormField(
                        hint: 'Hint text...',
                        label: 'Read only',
                        readOnly: true,
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                      SmartPasswordTextFormField(
                        hint: 'Hint text...',
                        label: 'Disabled',
                        disabled: true,
                        validator: FieldValidatorUtils.isRequired(),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SmartFilledButton(label: 'Submit', onPressed: () => _onSubmit(_formKey3)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
