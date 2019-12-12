import 'package:flutter/material.dart';
import 'package:money_left_over/models/expenditure.dart';
import 'package:money_left_over/widgets/expenditure_card.dart';

class ListExpenditure extends StatelessWidget {
  final Function confirmDelete;
  final List<Expenditure> myList;
  ListExpenditure({@required this.myList, this.confirmDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ObjectKey(myList[index]),
          child: ExpenditureCard(
            myList: myList[index],
          ),
          confirmDismiss: (DismissDirection direction) async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content:
                      const Text("Are you sure you wish to delete this item?"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          //To delete
                          confirmDelete(myList[index]);

                          Navigator.of(context).pop(true);
                        },
                        child: const Text("DELETE")),
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("CANCEL"),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
