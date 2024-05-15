import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/features/counter/bloc/counterbloc.dart';
import 'package:counterapp/features/counter/bloc/counterevent.dart';
import 'package:counterapp/features/counter/bloc/counterstate.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  String _computeBinary(int value) {
    return value.toRadixString(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        // Wrap the Column with Center widget
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the children vertically
              children: [
                Text(
                  state.counter.toString(),
                  style: const TextStyle(fontSize: 60),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center the children horizontally
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: const Text('decrement'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: const Text('increment'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'Binary of the counter is: ${_computeBinary(state.counter)}',
                  style: const TextStyle(fontSize: 30),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
