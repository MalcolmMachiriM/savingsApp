import 'package:flutter/material.dart';
import 'package:raundtable/constants/color_constants.dart';

import '../shared/services/date_service.dart';

class DateField extends StatefulWidget {
  final Function(Object?) onSaved;
  String? initialValue;
  final String labelText;
  TextEditingController? dateController;

  DateField({
    Key? key,
    required this.onSaved,
    this.initialValue,
    required this.labelText,
    this.dateController,
  }) : super(key: key);

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: mainAppColor)),
            child: TextFormField(
              keyboardType: TextInputType.none,
              initialValue: widget.initialValue,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.calendar_today),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                labelText: 'mm/dd/yyyy',
              ),
              onTap: () => _selectDate(context),
              onSaved: widget.onSaved,
              controller: widget.dateController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field Empty!';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Future _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: date,
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        widget.initialValue = null;
        widget.dateController = TextEditingController(
          text: DateService.removeTime(picked),
        );
      });
    }
  }
}
