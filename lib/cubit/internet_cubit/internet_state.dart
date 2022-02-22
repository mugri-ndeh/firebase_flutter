part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

enum ConnectionType { Wifi, Mobile }

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
