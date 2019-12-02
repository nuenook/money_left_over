import 'package:flutter/material.dart';
import 'package:money_left_over/models/expenditure.dart';

class ListExpenditure extends StatelessWidget {

  final List<Expenditure> myList;
  ListExpenditure({@required this.myList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.6, 0),
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
              ),
              title: Text(myList[index].amount.toString()),
              subtitle: Text('Text ${myList[index].note} '),
            ),
          ),
        );
      },
    );
  }
}
