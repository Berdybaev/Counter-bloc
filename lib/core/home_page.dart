import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    super.key,
  });

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter',
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is Counterloading) {
                  return const CircularProgressIndicator();
                }
                if (state is CounterError) {
                  return const Icon(Icons.error);
                }
                if (state is CounterSucces) {
                  _counter = state.counter;
                  return Text(
                    '${_counter ?? 0}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }

                return Text(
                  '${_counter ?? 0}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: (() {
              BlocProvider.of<CounterBloc>(context).add(
                IncrementEvent(counter: _counter ?? 0),
              );
            }),
            child: const Icon(Icons.plus_one),
          ),
          FloatingActionButton(
            onPressed: (() {
              BlocProvider.of<CounterBloc>(context).add(
                DecrementEvent(counter: _counter ?? 0),
              );
            }),
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
