import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/counter_bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData.dark(),
        home: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bloc Counter'),
        ),
        body: BlocBuilder<CounterBloc, int>(
          builder: (context, count) => Center(
            child: Text('${count}'),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(CounterEvent.increment);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(CounterEvent.decrement);
                },
              ),
            ),
          ],
        ));
  }
}
