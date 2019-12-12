import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:money_left_over/models/expenditure.dart';

abstract class ExpenditureState extends Equatable {
  const ExpenditureState();

  @override
  List<Object> get props => [];
}

class ExpenditureEmpty extends ExpenditureState {}

class ExpenditureLoading extends ExpenditureState {}

class ExpenditureLoaded extends ExpenditureState {
  final List<Expenditure> expenditures;

  const ExpenditureLoaded({@required this.expenditures});

  @override
  List<Object> get props => [expenditures];
}

class ExpenditureError extends ExpenditureState {}
