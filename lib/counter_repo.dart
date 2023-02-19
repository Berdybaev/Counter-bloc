class CounterRepo {
  int counter({required int counter}) {
    return counter + 1;
  }

  int decrement({required int counter}) {
    return counter - 1;
  }
}
