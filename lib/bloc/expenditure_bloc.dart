import 'package:bloc/bloc.dart';
import 'package:money_left_over/models/expenditure.dart';
import 'package:money_left_over/services/db_provider.dart';

import 'expenditure_event.dart';
import 'expenditure_state.dart';

class ExpenditureBloc extends Bloc<ExpenditureEvent, ExpenditureState> {
  @override
  ExpenditureState get initialState => ExpenditureEmpty();

  @override
  Stream<ExpenditureState> mapEventToState(ExpenditureEvent event) async* {
    if (event is FetchExpenditures) {
      yield ExpenditureLoading();

      try {
        final List<Expenditure> expens =
            await DBProvider.db.getAllExpenditure();

        yield ExpenditureLoaded(expenditures: expens);
      } catch (e) {
        print("FetchExpenditures error: $e");
        yield ExpenditureError();
      }
    }

    if (event is AddExpenditure) {
      if (state is ExpenditureLoaded) {
        try {
          var newExpenditureId =
              await DBProvider.db.newExpenditure(event.newExpenditure);

          event.newExpenditure.id = newExpenditureId;
          final List<Expenditure> updatedExpenditures =
              List.from((state as ExpenditureLoaded).expenditures)
                ..insert(0, event.newExpenditure);

          yield ExpenditureLoaded(expenditures: updatedExpenditures);
        } catch (e) {
          print("AddExpenditure error: $e");
          yield ExpenditureError();
        }
      }
    }

    if (event is RemoveExpenditure) {
      if (state is ExpenditureLoaded) {
        try {
          await DBProvider.db.deleteExpenditure(event.terminateExpenditure.id);
          final updatedExpenditures = (state as ExpenditureLoaded)
              .expenditures
              .where((ex) => ex.id != event.terminateExpenditure.id)
              .toList();

          yield ExpenditureLoaded(expenditures: updatedExpenditures);
        } catch (e) {
          print("RemoveExpenditure error: $e");
          yield ExpenditureError();
        }
      }
    }
  }
}
