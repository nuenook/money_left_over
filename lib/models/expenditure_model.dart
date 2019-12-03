import 'package:flutter/material.dart';
import 'package:money_left_over/models/expenditure.dart';

class ExpenditureModel with ChangeNotifier {
  final List<Expenditure> _expenditures = [
    new Expenditure(amount: 55, note: "test 1", onDate: DateTime.now()),
    new Expenditure(amount: 55, note: "test 2", onDate: DateTime.now()),
    new Expenditure(amount: 55, note: "test 3", onDate: DateTime.now())
  ];

  List<Expenditure> get allExpenditure => _expenditures;

  void addExpenditure(Expenditure newExpenditure) {
    _expenditures.insert(0, newExpenditure);
    notifyListeners();
  }

  void removeExpenditure(Expenditure newExpenditure) {
    _expenditures.remove(newExpenditure);
    notifyListeners();
  }

  void undoExpenditure(Expenditure oldExpenditure, int index) {
    _expenditures.insert(index, oldExpenditure);
    notifyListeners();
  }
}
