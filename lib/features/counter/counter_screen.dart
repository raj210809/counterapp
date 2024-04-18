import 'package:counterapp/features/counter/bloc/counterbloc.dart';
import 'package:counterapp/features/counter/bloc/counterevent.dart';
import 'package:counterapp/features/counter/bloc/counterstate.dart';
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
              style: const TextStyle(fontSize: 60),
            );
          }),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: const Text('decrement'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                child: const Text('increment'),
              ),
            ],
          ),
          Switch(value: context.read<CounterBloc>().state.isBinary, onChanged: (value){context.read<CounterBloc>().add(BinaryEvent());})
        ],
      ),
    );
  }
}
