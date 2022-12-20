import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:raundtable/components/custom_checkbox_tile.dart';
import 'package:raundtable/components/custom_rounded_btn.dart';
import 'package:raundtable/components/forms/index.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:raundtable/constants/frequency_enum.dart';
import 'package:raundtable/constants/others.dart';
import 'package:raundtable/constants/table_plans.dart';

class TableDetailsView extends StatefulWidget {
  const TableDetailsView({
    Key? key,
    required this.onNextCallback,
    required this.onCancelCallback,
  }) : super(key: key);

  final Function onNextCallback;
  final Function onCancelCallback;

  @override
  State<TableDetailsView> createState() => _TableDetailsViewState();
}

class _TableDetailsViewState extends State<TableDetailsView> {
  final formKey = GlobalKey<FormBuilderState>();

  bool acceptContinueContributing = false;
  bool acceptFailedContributionRules = false;
  bool acceptMembers = false;
  bool acceptReceivingOrder = false;

  bool hasAcceptedAll = false;

  void _checkConditions() {
    bool _state = acceptContinueContributing &&
        acceptFailedContributionRules &&
        acceptMembers &&
        acceptReceivingOrder;

    setState(() {
      hasAcceptedAll = _state;
    });
  }

  @override
  Widget build(BuildContext context) {
    _checkConditions();

    return Scaffold(
      body: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormField(
                context: context,
                formName: 'tableName',
                initialText: 'My Table',
                title: 'Table Name',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(context, errorText: ''),
                  ],
                ),
              ),
              CustomFormField(
                context: context,
                formName: 'contribution',
                title: 'Contribution',
                hintText: '\$',
                initialText: '\$250',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(context, errorText: ''),
                    FormBuilderValidators.numeric(context, errorText: '')
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      context: context,
                      formName: 'plan',
                      title: 'Plan',
                      initialText: tablePlans.first,
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context,
                              errorText: ''),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomFormField(
                      context: context,
                      formName: 'cycle',
                      title: 'Cycle',
                      readOnly: true,
                      initialText: frequencyCycles.first.name,
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context,
                              errorText: ''),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      context: context,
                      formName: 'startDate',
                      readOnly: true,
                      title: 'Start Date',
                      initialText: '01 May 2022',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context,
                              errorText: ''),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomFormField(
                      context: context,
                      formName: 'restartDate',
                      readOnly: true,
                      title: 'Restart Date',
                      initialText: '10 May 2022',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(context,
                              errorText: ''),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 10),
                child: Text('*First payment is due on start date'),
              ),
              const SizedBox(height: 20),
              CustomCheckBoxTile(
                onChanged: (value) {
                  setState(() {
                    acceptContinueContributing = value ?? false;
                  });
                },
                text: kAcceptContinueContributing,
                activeColor: mainAppColor,
                value: acceptContinueContributing,
                checkColor: mainWhiteColor,
              ),
              CustomCheckBoxTile(
                onChanged: (value) {
                  setState(() {
                    acceptFailedContributionRules = value ?? false;
                  });
                },
                text: kAcceptFailedContributionRules,
                activeColor: mainAppColor,
                value: acceptFailedContributionRules,
                checkColor: mainWhiteColor,
              ),
              CustomCheckBoxTile(
                onChanged: (value) {
                  setState(() {
                    acceptMembers = value ?? false;
                  });
                },
                text: kAcceptMembers,
                activeColor: mainAppColor,
                value: acceptMembers,
                checkColor: mainWhiteColor,
              ),
              CustomCheckBoxTile(
                onChanged: (value) {
                  setState(() {
                    acceptReceivingOrder = value ?? false;
                  });
                },
                text: kAcceptReceivingOrder,
                activeColor: mainAppColor,
                value: acceptReceivingOrder,
                checkColor: mainWhiteColor,
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
                        text: 'Join',
                        onTap: hasAcceptedAll
                            ? () async {
                                widget.onNextCallback();
                                // if (formKey.currentState!.validate()) {
                                //   formKey.currentState!.save();

                                //   final _data = formKey.currentState!.value;

                                //   // TODO: cache added data

                                //   widget.onNextCallback();
                                // }
                              }
                            : () {},
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
