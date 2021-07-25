import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: ++state.counterValue, wasIncremented: true));
  void descrement() => emit(
      CounterState(counterValue: --state.counterValue, wasIncremented: false));
}
