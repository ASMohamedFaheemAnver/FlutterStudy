import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_access/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription _connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    _connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (event == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else {
        emitInternetDisConnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisConnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    _connectivityStreamSubscription.cancel();
    return super.close();
  }
}
