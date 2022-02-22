import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity;
  late StreamSubscription streamSubscription;
  InternetCubit(this._connectivity) : super(InternetInitial()) {
    streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        emit(InternetConnected(connectionType: ConnectionType.Mobile));
      } else if (event == ConnectivityResult.wifi) {
        emit(InternetConnected(connectionType: ConnectionType.Wifi));
      } else if (event == ConnectivityResult.none) {
        emit(InternetDisconnected());
      }
    });
  }
  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
