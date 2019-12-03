import 'package:flutter/material.dart';
import 'package:money_left_over/models/expenditure_model.dart';
import 'package:money_left_over/widgets/add_expenditure_form.dart';
import 'package:money_left_over/widgets/list_expenditure.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: AddListForm(),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenditure"),
      ),
      body: Consumer<ExpenditureModel>(
        builder: (context, expenditure, child) => ListExpenditure(
          myList: expenditure.allExpenditure,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSettingPanel();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
