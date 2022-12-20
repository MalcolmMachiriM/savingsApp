import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:raundtable/components/custom_rounded_btn.dart';
import 'package:raundtable/components/forms/index.dart';
import 'package:raundtable/constants/color_constants.dart';
import 'package:relative_scale/relative_scale.dart';

class SavingsGoalView extends StatefulWidget {
  const SavingsGoalView({Key? key}) : super(key: key);

  @override
  State<SavingsGoalView> createState() => _SavingsGoalViewState();
}

class _SavingsGoalViewState extends State<SavingsGoalView> {
  final formKey = GlobalKey<FormBuilderState>();
  final goalFormKey = GlobalKey<FormBuilderState>();

  List<_SavingGoal> _savinGoals = _SavingGoal.defaultGoals;

  void addToGoals(_SavingGoal sv) {
    final List<_SavingGoal> currentList = _savinGoals;

    currentList.add(sv);

    final List<_SavingGoal> updated = List.from(currentList);

    setState(() {
      _savinGoals = updated.toSet().toList();
    });
  }

  void updateFromGoals(_SavingGoal sg) {
    final List<_SavingGoal> currentList = _savinGoals;

    currentList.remove(sg);

    final List<_SavingGoal> updated = List.from(currentList);

    setState(() {
      _savinGoals = updated;
    });

    addToGoals(sg.copyWith(state: !sg.state));
  }

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
          title: const Text('Step 3 of 3'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: FormBuilder(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Savings Goals',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 20),
                CustomFormField(
                  context: context,
                  formName: 'savings',
                  initialText: '520',
                  labelText: 'How much do you want to save?',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context, errorText: ''),
                      FormBuilderValidators.numeric(context, errorText: ''),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'What you are saving for',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _savinGoals
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            updateFromGoals(e);
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: e.state ? mainAppColor : fieldFillColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              e.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: e.state
                                        ? mainWhiteColor
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.backgroundColor,
                                  ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 30),
                Text(
                  'Item not listed?',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Center(
                  child: CustomRoundedButton(
                    text: 'Add Goal Items',
                    isOutlined: true,
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        useRootNavigator: true,
                        builder: (context) => RelativeBuilder(
                            builder: (context, height, width, sy, sx) {
                          return SizedBox(
                            height: 350,
                            width: double.infinity,
                            child: Scaffold(
                              resizeToAvoidBottomInset: true,
                              body: SingleChildScrollView(
                                padding: const EdgeInsets.all(16.0),
                                child: FormBuilder(
                                  key: goalFormKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Add Goal',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.copyWith(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      const Divider(),
                                      CustomFormField(
                                        context: context,
                                        formName: 'goal',
                                        title: 'New Goal',
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                                context,
                                                errorText: '')
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: CustomRoundedButton(
                                          text: 'Add',
                                          onTap: () async {
                                            if (goalFormKey.currentState!
                                                .validate()) {
                                              goalFormKey.currentState!.save();
                                              final _data = goalFormKey
                                                  .currentState!.value;

                                              final _SavingGoal sv =
                                                  _SavingGoal(
                                                      name: _data['goal'],
                                                      state: true);

                                              addToGoals(sv);

                                              Navigator.pop(context);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 60),
                Center(
                  child: CustomRoundedButton(
                    text: 'Finish',
                    onTap: () {
                      // TODO: Validate form and route
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SavingGoal {
  final bool state;
  final String name;

  _SavingGoal({
    this.state = false,
    required this.name,
  });

  static List<_SavingGoal> get defaultGoals => [
        _SavingGoal(name: 'Car'),
        _SavingGoal(name: 'Tuition'),
        _SavingGoal(name: 'Phone'),
        _SavingGoal(name: 'TV'),
        _SavingGoal(name: 'Food'),
        _SavingGoal(name: 'Boost Savings'),
        _SavingGoal(name: 'Holiday'),
        _SavingGoal(name: 'Camera'),
        _SavingGoal(name: 'Furniture'),
      ];

  _SavingGoal copyWith({
    bool? state,
    String? name,
  }) {
    return _SavingGoal(
      state: state ?? this.state,
      name: name ?? this.name,
    );
  }
}
