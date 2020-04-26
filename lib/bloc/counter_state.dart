
abstract class CounterState {
  final int counter;

  const CounterState(this.counter);

}

class CurrentCounterState extends CounterState {

  const CurrentCounterState(int counter) : super(counter);

  @override
  String toString() => 'Initial { counter: $counter }';
}

class ErrorCounterState extends CounterState {
  final String message;

  const ErrorCounterState(int counter, this.message) : super(counter);

  @override
  String toString() => 'Error { message: $message }';
}