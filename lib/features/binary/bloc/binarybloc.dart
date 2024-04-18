

import 'package:counterapp/features/binary/bloc/binaryevent.dart';
import 'package:counterapp/features/binary/bloc/binarystate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntToBinaryBloc extends Bloc<BinaryEvent , ConvertedBinary>{
  IntToBinaryBloc() : super(ConvertedBinary(0)){
    on<IntToBinary>(_convertbinary);
  }
  void _convertbinary(
    IntToBinary event , Emitter<ConvertedBinary> emit) {
      int? value = int.tryParse(event.integer , radix:2);
      if (value != null) {
        emit(ConvertedBinary(value));
      }
    }
}