import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(value: 0, incremented: false));

  void increment() =>
      emit(CounterState(value: state.value + 1, incremented: true));
  void decrement() =>
      emit(CounterState(value: state.value - 1, incremented: false));
}
