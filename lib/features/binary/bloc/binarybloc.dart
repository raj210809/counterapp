import 'package:counterapp/features/binary/bloc/binaryevent.dart';
import 'package:counterapp/features/binary/bloc/binarystate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntToBinaryBloc extends Bloc<BinaryEvent , ConvertedBinary>{
  IntToBinaryBloc() : super(const ConvertedBinary(0)){
    on<BinaryToInt>(_convertbinary);
  }
  void _convertbinary(
    BinaryToInt event , Emitter<ConvertedBinary> emit) {
      int? num = int.tryParse(event.binaryinput , radix:2);
      if (num != null) {
        emit(ConvertedBinary(num));
      }
    }
}