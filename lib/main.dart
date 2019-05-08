import 'package:flutter/material.dart';
import 'package:flutter_app_sql_example/counter/counter_bloc.dart';
import 'package:flutter_app_sql_example/counter/bloc_counter_page.dart';
import 'package:flutter_app_sql_example/counter/counter_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: new CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterPage(),
      ),
    );
  }
}

