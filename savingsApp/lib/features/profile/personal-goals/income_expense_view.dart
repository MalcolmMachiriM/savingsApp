import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:raundtable/components/custom_rounded_btn.dart';
import 'package:raundtable/components/forms/index.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:raundtable/shared/utils/index.dart';

import 'savings_goal_view.dart';

class IncomeExpenseView extends StatefulWidget {
  const IncomeExpenseView({Key? key}) : super(key: key);

  @override
  State<IncomeExpenseView> createState() => _IncomeExpenseViewState();
}

class _IncomeExpenseViewState extends State<IncomeExpenseView> {
  final formKey = GlobalKey<FormBuilderState>();

  final bool _value = false;

  int val = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.chevron_left),
          ),
          title: const Text('Step 2 of 3'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: FormBuilder(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Income and\nExpenses',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 30),
                CustomFormField(
                  context: context,
                  formName: 'monthlyIncome',
                  initialText: '10000',
                  labelText: 'Monthly Income After Tax',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context, errorText: ''),
                      FormBuilderValidators.numeric(context, errorText: ''),
                    ],
                  ),
                ),
                CustomFormField(
                  context: context,
                  formName: 'monthlyExpense',
                  initialText: '2500',
                  labelText: 'Total Monthly Expenses',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context, errorText: ''),
                      FormBuilderValidators.numeric(context, errorText: ''),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text("I am renting"),
                  leading: Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (int? value) {
                      setState(() {
                        val = value ?? -1;
                      });
                    },
                    activeColor: mainAppColor,
                    toggleable: true,
                  ),
                ),
                ListTile(
                  title: const Text("I have a mortage"),
                  leading: Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (int? value) {
                      setState(() {
                        val = value ?? -1;
                      });
                    },
                    activeColor: mainAppColor,
                  ),
                ),
                ListTile(
                  title: const Text("None of above"),
                  leading: Radio(
                    value: 3,
                    groupValue: val,
                    onChanged: (int? value) {
                      setState(() {
                        val = value ?? -1;
                      });
                    },
                    activeColor: mainAppColor,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: CustomRoundedButton(
                      text: 'Next',
                      onTap: () async {
                        // TODO: Validate form and route
                        routeTo(context, const SavingsGoalView());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
