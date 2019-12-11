import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money_left_over/models/expenditure.dart';
import 'package:money_left_over/services/db_provider.dart';

class ExpenditureModel with ChangeNotifier {
  final List<Expenditure> _expenditures = [];

  List<Expenditure> get allExpenditure => _expenditures;

  StreamController<List<Expenditure>> controller = StreamController<List<Expenditure>>();

  Stream get Expenditures => controller.stream;

  getExpenditures() async {
    var result = await DBProvider.db.getAllExpenditure();

    _expenditures.addAll(result);
    controller.add(_expenditures);
  }

  void addExpenditure(Expenditure newExpenditure) async {
    var result = await DBProvider.db.newClient(newExpenditure);
    _expenditures.insert(0, newExpenditure);
    controller.add(_expenditures);
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
