import 'package:counterapp/bloc/counternumber/counterbloc.dart';
import 'package:counterapp/bloc/counternumber/counterevent.dart';
import 'package:counterapp/bloc/counternumber/counterstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              state.counter.toString(),
              style:const TextStyle(fontSize: 60),
            );
          }),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child:const Text('decrement'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                child:const Text('increment'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
