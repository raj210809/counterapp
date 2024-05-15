import 'package:bloc/bloc.dart';
import 'package:counterapp/features/counter/bloc/counterevent.dart';
import 'package:counterapp/features/counter/bloc/counterstate.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0, '000')) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    var counterState = state.counter + 1;
    var binary = int.parse(counterState.toString()).toRadixString(2);
    emit(CounterState(counterState, binary));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    var counterState = state.counter - 1;
    var binary = int.parse(counterState.toString()).toRadixString(2);
    emit(CounterState(counterState, binary));
  }
}
