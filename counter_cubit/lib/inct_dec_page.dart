// ignore_for_file: unused_local_variable

import 'package:counter_cubit/bloc/counter_bloc.dart';
import 'package:counter_cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              //counterCubit.increment();

              //We use the instance of counter bloc and added an event and the event was the [CounterIncremented()]
              counterBloc.add(CounterIncremented());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              //counterCubit.decrement();
              counterBloc.add(CounterDecremented());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterReset());
              //counterCubit.reset();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.restore_rounded),
          ),
        ],
      ),
    );
  }
}
