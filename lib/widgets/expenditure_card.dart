import 'package:flutter/material.dart';
import 'package:money_left_over/models/expenditure.dart';

class ExpenditureCard extends StatelessWidget {
  final Expenditure myList;
  ExpenditureCard({this.myList});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.6, 0),
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
          ),
          title: Text(myList.amount.toString()),
          subtitle: Text('${myList.note.isEmpty ? '-' : myList.note}'),
        ),
      ),
    );
  }
}
