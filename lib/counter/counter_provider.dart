import 'package:flutter/material.dart';
import 'package:flutter_app_sql_example/counter/counter_bloc.dart';

class CounterProvider extends InheritedWidget {
  final CounterBloc counter;
  final Widget child;

  CounterProvider({Key key, this.counter, this.child}) : super(key: key);

  static CounterProvider of(BuildContext context) => (context.inheritFromWidgetOfExactType(CounterProvider));

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return oldWidget.counter != this.counter;
  }
}
