class Expenditure {
  int id;
  String note;
  double amount;
  String onDate;

  Expenditure({this.amount, this.note, this.onDate, this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'note': note,
      'amount': amount,
      'onDate': onDate,
    };
    return map;
  }

  factory Expenditure.fromMap(Map<String, dynamic> map) => new Expenditure(
        id: map['id'],
        amount: map['amount'],
        note: map['note'],
        onDate: map['onDate'],
      );
}
