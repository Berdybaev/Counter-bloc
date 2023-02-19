part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  final int counter;
  IncrementEvent({required this.counter});
}

class DecrementEvent extends CounterEvent {
  final int counter;
  DecrementEvent({required this.counter});
}
