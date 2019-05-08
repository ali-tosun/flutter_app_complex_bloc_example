import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _itemCount = 0;

  final _counterSubject = BehaviorSubject<int>();

  Stream<int> get counter => _counterSubject.stream;

  final _counterEventSubject = BehaviorSubject<AbstractCounter>();

  Sink<AbstractCounter> get counterEvent => _counterEventSubject.sink;

  CounterBloc() {
    _counterEventSubject.stream.listen((data) {
      if (data is IncrementCounter) {
        _counterSubject.add(_itemCount++);
      } else {
        _counterSubject.add(_itemCount--);
      }
    });
  }
}

abstract class AbstractCounter {}

class IncrementCounter extends AbstractCounter {}

class DecrementCounter extends AbstractCounter {}
