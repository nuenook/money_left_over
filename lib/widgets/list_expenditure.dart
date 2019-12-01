import 'package:flutter/material.dart';
import 'package:money_left_over/models/expenditure.dart';

class ListExpenditure extends StatefulWidget {
  @override
  _ListExpenditureState createState() => _ListExpenditureState();
}

class _ListExpenditureState extends State<ListExpenditure> {

  @override
  Widget build(BuildContext context) {

    List<Expenditure> my_list  = new List<Expenditure>();
    my_list.add(new Expenditure(amount: 55, note: "test 1", onDate: DateTime.now()));
    my_list.add(new Expenditure(amount: 55, note: "test 2", onDate: DateTime.now()));
    my_list.add(new Expenditure(amount: 55, note: "test 3", onDate: DateTime.now()));

    return ListView.builder(
      itemCount: my_list.length,
      itemBuilder: (context, index) {
      return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.6, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
          ),
          title: Text(my_list[index].amount.toString()),
          subtitle: Text('Text ${my_list[index].note} '),
        ),
      ),
    );
      },
    );
  }
}
