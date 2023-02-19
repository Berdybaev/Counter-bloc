import 'package:bloc1/core/bloc/counter_bloc.dart';
import 'package:bloc1/core/home_page.dart';
import 'package:bloc1/counter_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CounterRepo(),
      child: BlocProvider(
        create: (context) =>
            CounterBloc(repo: RepositoryProvider.of<CounterRepo>(context)),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: MyHomePage(),
        ),
      ),
    );
  }
}
