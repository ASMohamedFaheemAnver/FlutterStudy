import 'package:bloc_provider/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: ++state.counterValue));
  void descrement() => emit(CounterState(counterValue: --state.counterValue));
}
