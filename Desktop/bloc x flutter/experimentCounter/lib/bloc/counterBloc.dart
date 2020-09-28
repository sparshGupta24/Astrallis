import 'dart:async';

import 'package:experimentCounter/bloc/counterEvent.dart';

class CounterBloc{
  int _counter = 0;
  
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }

  _mapEventToState(CounterEvent event){
    if(event is IncrementEvent)
    _counter++;
    else
    if(event is DecrementEvent)
    _counter--;

    _inCounter.add(_counter);
  }

  void dispose(){
    _counterEventController.close();
    _counterStateController.close();
  }
}