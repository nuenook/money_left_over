import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:money_left_over/models/expenditure.dart';

class AddListForm extends StatefulWidget {
  final Function onSubmit;
  AddListForm({this.onSubmit});

  @override
  _AddListFormState createState() => _AddListFormState();
}

class _AddListFormState extends State<AddListForm> {
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");

  final amountController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              'Amount',
              style: TextStyle(fontSize: 18.0),
            ),
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: (val) => val.isEmpty ? 'Please enter a amount' : null,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter(new RegExp(
                    '^[+-]?(([1-9][0-9]*)?[0-9](\.[0-9]*)?|\.[0-9]+)\$'))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Date',
              style: TextStyle(fontSize: 18.0),
            ),
            DateTimeField(
              initialValue: DateTime.now(),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Note',
              style: TextStyle(fontSize: 18.0),
            ),
            TextFormField(
              controller: noteController,
            ),
            RaisedButton(
              color: Colors.pink[400],
              child: Text('Add', style: TextStyle(color: Colors.white)),
              onPressed: () {
                ///TODO: Use real timestamp from select date and make compatible to datetime of SqlLite
                ///, currently hard code timestamp to string
                if (_formKey.currentState.validate()) {
                  var newExpenditure = Expenditure(
                      amount: double.parse(amountController.text),
                      onDate:
                          new DateTime.now().millisecondsSinceEpoch.toString(),
                      note: noteController.text);
                  widget.onSubmit(newExpenditure);
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
