part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class Counterloading extends CounterState {}

class CounterSucces extends CounterState {
  final int counter;
  CounterSucces({required this.counter});
}

class CounterError extends CounterState {}
