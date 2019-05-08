import 'package:flutter/material.dart';
import 'package:flutter_app_sql_example/counter/counter_bloc.dart';
import 'package:flutter_app_sql_example/counter/counter_provider.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = CounterProvider.of(context).counter;
    return Scaffold(
      appBar: AppBar(
        title: Text("deneme title"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new StreamBuilder(
                stream: counterBloc.counter,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Column(
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        snapshot.data.toString(),
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "fabDecrement",
            onPressed: () => counterBloc.counterEvent.add(DecrementCounter()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: "fabIncrement",
            onPressed: () => counterBloc.counterEvent.add(IncrementCounter()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
