import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
/*
Bloc requires event and a state
Events: *Pressed a button* - this is an event that can be captured and will be sent into the counter bloc
so we can we can update the state!

in cubit we use functions/methods

bloc - we can just create a an events and base on those events we have to create handlers and the state will be update
*/

/*- Now we need to create a parent class That holds all of the events that we created
  - we need to close it all on sealed.
  why sealed class?

  because what if we use 
*/
// sealed class CounterEvent {}

// /*Whenever we created an event for our app we need to create an event handler. */
// final class CounterIncremented extends CounterEvent {}

// final class CounterDecremented extends CounterEvent {}

// final class CounterReset extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    /*on bloc statemanagement we dont use functions we use events thats why we dont use emit directly */
    on<CounterIncremented>(
      (event, emit) {
        emit(state + 1);
      },
    );

    on<CounterDecremented>(
      (event, emit) {
        if (state == 0) {
          return;
        }
        emit(state - 1);
      },
    );

    on<CounterReset>((event, emit) {
      emit(0);
    });
  }
}
