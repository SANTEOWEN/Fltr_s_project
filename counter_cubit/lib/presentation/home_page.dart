// ignore_for_file: unused_local_variable

import 'package:counter_cubit/bloc/counter_bloc.dart';
import 'package:counter_cubit/cubit/counter_cubit.dart';
import 'package:counter_cubit/inct_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    //We Always need to initialize all of our blocs that we created.
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, int>(
              //in Bloc we dont need to use the [bloc] parameter anymore because we already provided it globaly main.dart.
              //bloc: counterBloc
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const IncDecPage(),
            ),
          );
        },
        child: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
