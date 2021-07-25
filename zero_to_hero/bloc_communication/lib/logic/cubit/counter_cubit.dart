import 'dart:async';

import 'package:bloc_access/constants/enums.dart';
import 'package:bloc_access/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;
  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, wasIncremented: false)) {
    internetStreamSubscription = internetCubit.stream.listen((event) {
      if (event is InternetConnected &&
          event.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (event is InternetConnected &&
          event.connectionType == ConnectionType.Mobile) {
        descrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: ++state.counterValue, wasIncremented: true));
  void descrement() => emit(
      CounterState(counterValue: --state.counterValue, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
