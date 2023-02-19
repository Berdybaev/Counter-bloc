import 'package:bloc/bloc.dart';
import 'package:bloc1/counter_repo.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({required this.repo}) : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) async {
      emit(Counterloading());
      await Future.delayed(
        Duration(seconds: 1),
      );

      int result = repo.counter(counter: event.counter);

      if (result > 10) {
        emit(CounterError());
      } else
        emit(CounterSucces(counter: result));
    });
    on<DecrementEvent>((event, emit) async {
      emit(Counterloading());
      await Future.delayed(
        Duration(seconds: 1),
      );

      int result = repo.decrement(counter: event.counter);

      if (result < -10) {
        emit(CounterError());
      } else
        emit(CounterSucces(counter: result));
    });
  }
  final CounterRepo repo;
}
