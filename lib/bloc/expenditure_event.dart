import 'package:equatable/equatable.dart';
import 'package:money_left_over/models/expenditure.dart';

abstract class ExpenditureEvent extends Equatable {
  const ExpenditureEvent();
}

class FetchExpenditures extends ExpenditureEvent {
  const FetchExpenditures();

  @override
  List<Object> get props => [];
}

class AddExpenditure extends ExpenditureEvent {
  final Expenditure newExpenditure;

  const AddExpenditure({this.newExpenditure});

  @override
  List<Object> get props => [newExpenditure];
}

class RemoveExpenditure extends ExpenditureEvent {
  final Expenditure terminateExpenditure;

  const RemoveExpenditure({this.terminateExpenditure});

  @override
  List<Object> get props => [terminateExpenditure];

}