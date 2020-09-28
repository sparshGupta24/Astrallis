import 'package:flutter/material.dart';

import 'bloc/counterBloc.dart';
import 'bloc/counterEvent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CounterBloc _bloc = new CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOC Counter experiment"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) =>
                Text(
              snapshot.data.toString(),
            ),
            stream: _bloc.counter,
            initialData: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
              ),
            ],
          )
        ],
      ),
    );
  }
}
