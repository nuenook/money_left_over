import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_left_over/bloc/expenditure_bloc.dart';
import 'package:money_left_over/bloc/expenditure_event.dart';
import 'package:money_left_over/bloc/expenditure_state.dart';
import 'package:money_left_over/models/expenditure.dart';

import 'list_expenditure.dart';

class GroupExpenditures extends StatelessWidget {
  const GroupExpenditures({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExpenditureBloc>(context).add(FetchExpenditures());

    /// format a money number
    final formatter = new NumberFormat("#,###.##");
    return BlocBuilder<ExpenditureBloc, ExpenditureState>(
        builder: (context, state) {
      if (state is ExpenditureEmpty) {
        return Center(
          child: Text('Please add some transection ?'),
        );
      }
      if (state is ExpenditureLoaded) {

        final expenditures = state.expenditures;
        
        var sum = 0.0;
        if (expenditures.length > 0) {
          sum = expenditures
              .map((ea) => ea.amount)
              .reduce((curr, next) => curr + next);
        }
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('\$ ${formatter.format(sum)} \$'),
            ),
            Expanded(
              child: ListExpenditure(
                myList: expenditures,
                confirmDelete: (Expenditure willDeleteExpenditure) {
                  BlocProvider.of<ExpenditureBloc>(context).add(
                      RemoveExpenditure(
                          terminateExpenditure: willDeleteExpenditure));
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      }

      /// return some empty Widgets before Bloc state is ready
      return Container();

     
    });
  }
}
