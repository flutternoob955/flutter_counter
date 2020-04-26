import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_counter/bloc/counter_state.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  int counter = 0;

  @override
  CounterState get initialState => CurrentCounterState(0);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {

    if (event is CounterDecrement) {
      counter = counter - 1;
      if (counter < 0) {
        counter = 0;
        yield ErrorCounterState(counter, "Can't be smaller than 0");
      } else {
        yield CurrentCounterState(counter);
      }
    }

    if (event is CounterIncrement) {
      counter = counter + 1;
      if (counter > 10) {
        counter = 10;
        yield ErrorCounterState(counter, "Can't be greater than 10");
      } else {
        yield CurrentCounterState(counter);
      }
    }
  }
}
