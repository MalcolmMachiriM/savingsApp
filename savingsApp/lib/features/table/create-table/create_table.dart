import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:raundtable/components/custom_rounded_btn.dart';
import 'package:raundtable/components/forms/index.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:raundtable/constants/frequency_enum.dart';
import 'package:raundtable/constants/table_plans.dart';
import 'package:raundtable/shared/models/table/rt_table.dart';
import 'package:raundtable/shared/services/shared_pref_service.dart';

extension RandomOfDigits on Random {
  /// Generates a non-negative random integer with a specified number of digits.
  ///
  /// Supports [digitCount] values between 1 and 9 inclusive.
  int nextIntOfDigits(int digitCount) {
    assert(1 <= digitCount && digitCount <= 9);
    int min = digitCount == 1 ? 0 : pow(10, digitCount - 1).toInt();
    int max = pow(10, digitCount).toInt();
    return min + nextInt(max - min);
  }
}

class CreateTableFormView extends StatefulWidget {
  const CreateTableFormView({
    Key? key,
    required this.onNextCallback,
    required this.onCancelCallback,
  }) : super(key: key);

  final Function onNextCallback;
  final Function onCancelCallback;

  @override
  State<CreateTableFormView> createState() => _CreateTableFormViewState();
}

class _CreateTableFormViewState extends State<CreateTableFormView> {
  final SharedPreferencesService sharedPref = SharedPreferencesService();

  final formKey = GlobalKey<FormBuilderState>();

  final int _tableNumMaxDigits = 5;

  List<int> _tableNumbers = [];

  int _tableNumber = 0;

  void _generateTableNumber() {
    final random = Random();

    setState(() {
      _tableNumber = random.nextIntOfDigits(_tableNumMaxDigits);
      _tableNumbers =
          _tableNumber.toString().split('').map((e) => int.parse(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _generateTableNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _tableNumbers
                    .map(
                      (e) => Expanded(
                        child: CustomFormField(
                          readOnly: true,
                          context: context,
                          formName: 'tabNum_$e',
                          keyboardType: TextInputType.number,
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(context,
                                  errorText: ''),
                              FormBuilderValidators.numeric(context,
                                  errorText: '')
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              CustomFormField(
                context: context,
                formName: 'tableName',
                labelText: 'Table Name',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(context, errorText: ''),
                  ],
                ),
              ),
              CustomFormField(
                context: context,
                formName: 'contribution',
                labelText: 'Contribution',
                hintText: '\$',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(context, errorText: ''),
                    FormBuilderValidators.numeric(context, errorText: '')
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 10),
                  child: Text(
                    '*You can change contribution amount later',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: mainAppColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdownField(
                      context: context,
                      formName: 'plan',
                      labelText: 'Plan',
                      suffixIcon: const Icon(Icons.expand_more),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context,
                              errorText: ''),
                        ],
                      ),
                      items: tablePlans
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: CustomDropdownField(
                      context: context,
                      formName: 'cycle',
                      labelText: 'Cycle',
                      suffixIcon: const Icon(Icons.expand_more),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context,
                              errorText: ''),
                        ],
                      ),
                      items: frequencyCycles
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              CustomDateField(
                context: context,
                formName: 'startDate',
                labelText: 'Start Date',
                format: DateFormat('dd EEE yyyy'),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(context, errorText: ''),
                    (DateTime? dateTime) {
                      if (dateTime != null) {
                        bool isFuture = dateTime.isAfter(DateTime.now());

                        // err text
                        return isFuture ? 'invalid (future) date' : null;
                      }

                      return null;
                    },
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 10),
                  child: Text(
                    '*You can change start date later',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: mainAppColor),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomRoundedButton(
                        text: 'Cancel',
                        isOutlined: true,
                        onTap: () {
                          widget.onCancelCallback();
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomRoundedButton(
                        text: 'Next',
                        onTap: () async {
                          // widget.onNextCallback();
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            final _data = formKey.currentState!.value;

                            final _currentUser =
                                await sharedPref.getCurrentUser();

                            if (_currentUser == null) {
                              return;
                            }

                            final RtTable rtTable = RtTable(
                              number: _tableNumber.toString(),
                              name: _data['tableName'],
                              plan: _data['plan'],
                              creatorID: _currentUser.phoneNumber,
                              amount: _data['contribution'],
                              frequency: _data['cycle'],
                              startDate: _data['startDate'],
                            );

                            await sharedPref.cacheCurrentCreatedTable(rtTable);

                            widget.onNextCallback();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
