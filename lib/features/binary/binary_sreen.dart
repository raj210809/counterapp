import 'package:counterapp/features/binary/bloc/binaryevent.dart';
import 'package:counterapp/features/counter/bloc/counterbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/features/binary/bloc/binarybloc.dart';
import 'package:counterapp/features/binary/bloc/binarystate.dart';

class BinaryView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return
     BlocProvider(create: (context)=>IntToBinaryBloc(),
     child: MyWidget());
  }
}


class MyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController convertercontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Binary'),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<IntToBinaryBloc, ConvertedBinary>(
        builder: (context, state) {
          return Column(
            children: [
              TextField(
                controller: convertercontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'input binary number'),
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<IntToBinaryBloc>()
                        .add(IntToBinary(convertercontroller.text));
                  },
                  child: const Text('convert')),
              BlocBuilder<IntToBinaryBloc, ConvertedBinary>(builder: (context, state) {
                return Text(
                  'Number of written binary is : ${state.binary}',
                  style: const TextStyle(fontSize: 30),
                );
              })
            ],
          );
        },
      ),
    );
  }
}
