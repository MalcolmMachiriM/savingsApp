import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:raundtable/components/custom_rounded_btn.dart';
import 'package:raundtable/components/forms/index.dart';
import 'package:raundtable/constants/color_constants.dart';

class SelectTableFormView extends StatefulWidget {
  const SelectTableFormView({
    Key? key,
    required this.onNextCallback,
    required this.onCancelCallback,
  }) : super(key: key);

  final Function onNextCallback;
  final Function onCancelCallback;

  @override
  State<SelectTableFormView> createState() => _SelectTableFormViewState();
}

class _SelectTableFormViewState extends State<SelectTableFormView> {
  final formKey = GlobalKey<FormBuilderState>();

  final int _tableNumMaxDigits = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Table Number',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    _tableNumMaxDigits,
                    (index) => Expanded(
                      child: CustomFormField(
                        context: context,
                        formName: 'tabNum${index + 1}',
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
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Select Table',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: fieldFillColor),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text('My Table $index'),
                          subtitle: const Text('#12345'),
                          trailing: index.isEven
                              ? const Icon(
                                  Icons.done_rounded,
                                  color: mainAppColor,
                                )
                              : const Icon(
                                  Icons.circle,
                                  color: fieldFillColor,
                                ),
                        );
                      }),
                      separatorBuilder: (_, x) => const Divider(
                        color: fieldFillColor,
                        thickness: 1,
                      ),
                      itemCount: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Member List',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: fieldFillColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Text(
                            'Current members',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: mainAppColor),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                leading: const CircleAvatar(),
                                title: Text('Member $index'),
                              );
                            }),
                            itemCount: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: fieldFillColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Text(
                            'Invited members',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: mainAppColor),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                leading: const CircleAvatar(),
                                title: Text('Member $index'),
                              );
                            }),
                            itemCount: 2,
                          ),
                        ),
                      ],
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
                            widget.onNextCallback();
                            // if (formKey.currentState!.validate()) {
                            //   formKey.currentState!.save();

                            //   final _data = formKey.currentState!.value;

                            //   // TODO: cache added data

                            //   widget.onNextCallback();
                            // }
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
      ),
    );
  }
}
