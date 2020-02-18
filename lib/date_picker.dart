import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  final dateController = TextEditingController();
  final Function(String dateTime) onChangeDate;
  BasicDateField(this.onChangeDate);
  DateTime pickedDate;
  Future showDatePickerFuture;
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      controller: dateController,
      decoration: InputDecoration(labelText: 'Date'),
      onShowPicker: (context, currentValue) {
        showDatePickerFuture = showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime.now(),
        );
        showDatePickerFuture.then((_pickedDate) {
          if (pickedDate != null) {
            pickedDate = _pickedDate;
            onChangeDate(pickedDate.toString());
          }
        });
        return showDatePickerFuture;
      },
    );
  }
}
