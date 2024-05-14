import 'package:bloc/bloc.dart';
import 'package:counterapp/features/counter/bloc/counterevent.dart';
import 'package:counterapp/features/counter/bloc/counterstate.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0, '000')) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<BinaryEvent>(_binaryshow);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    var counterstate = state.counter + 1;
    var binary = int.parse(counterstate.toString()).toRadixString(2);
    emit(CounterState(counterstate, binary));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    var counterstate = state.counter - 1;
    var binary = int.parse(counterstate.toString()).toRadixString(2);
    emit(CounterState(counterstate, binary));
  }

  void _binaryshow(BinaryEvent event, Emitter<CounterState> emit) {
    var binary = int.parse(state.counter.toString()).toRadixString(2);

    emit(CounterState(state.counter, binary));
  }
}
