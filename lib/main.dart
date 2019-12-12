import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_left_over/screens/home_page.dart';

import 'bloc/expenditure_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<ExpenditureBloc>(
          create: (context) => ExpenditureBloc(),
          child: HomePage(),
        ));
  }
}
