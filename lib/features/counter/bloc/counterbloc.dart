import 'package:bloc/bloc.dart';
import 'package:counterapp/features/counter/bloc/counterevent.dart';
import 'package:counterapp/features/counter/bloc/counterstate.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0, false)) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<BinaryEvent>(_togglebinary);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(CounterState(state.counter + 1, state.isBinary));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(CounterState(state.counter - 1, state.isBinary));
  }

  void _togglebinary(BinaryEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.counter, !(state.isBinary)));
  }
}
