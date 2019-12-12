import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_left_over/bloc/expenditure_bloc.dart';
import 'package:money_left_over/bloc/expenditure_event.dart';
import 'package:money_left_over/models/expenditure.dart';
import 'package:money_left_over/widgets/add_expenditure_form.dart';
import 'package:money_left_over/widgets/group_expenditures.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingPanel(Function onSubmit) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: AddListForm(onSubmit: onSubmit),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Expenditure"),
      ),
      body: GroupExpenditures(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var onSubmit = (Expenditure newExpenditure) {
            BlocProvider.of<ExpenditureBloc>(context)
                .add(AddExpenditure(newExpenditure: newExpenditure));
          };

          _showSettingPanel(onSubmit);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
