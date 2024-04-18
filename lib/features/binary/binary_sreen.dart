import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/features/binary/bloc/binarybloc.dart';
import 'package:counterapp/features/binary/bloc/binaryevent.dart';
import 'package:counterapp/features/binary/bloc/binarystate.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController binaryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Binary'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: BlocBuilder<IntToBinaryBloc, ConvertedBinary>(
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: binaryController,
                  decoration: const InputDecoration(
                    labelText: 'Enter the number',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Retrieve the instance of IntToBinaryBloc using context
                    final bloc = BlocProvider.of<IntToBinaryBloc>(context);
                    // Add event to the bloc
                    bloc.add(IntToBinary(binaryController.text));
                  },
                  child: const Text('Convert'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Converted number is: ${state.binary}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}