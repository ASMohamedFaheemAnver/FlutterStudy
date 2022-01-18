import 'package:bloc_access/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: ++state.counterValue, wasIncremented: true));
  void descrement() => emit(
      CounterState(counterValue: --state.counterValue, wasIncremented: false));
}
