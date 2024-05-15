import 'package:counterapp/features/binaryToInt/bloc/binaryevent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/features/binaryToInt/bloc/binarybloc.dart';
import 'package:counterapp/features/binaryToInt/bloc/binarystate.dart';

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
        title: const Text('Binary to Number'),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<IntToBinaryBloc, ConvertedBinary>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: convertercontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'input binary number'),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<IntToBinaryBloc>()
                        .add(BinaryToInt(convertercontroller.text));
                  },
                  child: const Text('convert')),
              const SizedBox(
                height: 30,
              ),
              Text(
                  'Number of written binary is : ${state.number}',
                  style: const TextStyle(fontSize: 30),
                ) 
            ],
          );
        },
      ),
    );
  }
}
