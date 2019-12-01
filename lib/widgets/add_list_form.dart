import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddListForm extends StatefulWidget {
  @override
  _AddListFormState createState() => _AddListFormState();
}

class _AddListFormState extends State<AddListForm> {
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");

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
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Date',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 20.0,
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
            TextFormField(),
            RaisedButton(
              color: Colors.pink[400],
              child: Text('Add', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
