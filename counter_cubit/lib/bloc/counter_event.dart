
part of 'counter_bloc.dart';
sealed class CounterEvent {}

/*Whenever we created an event for our app we need to create an event handler. */
final class CounterIncremented extends CounterEvent {}

final class CounterDecremented extends CounterEvent {}

final class CounterReset extends CounterEvent {}
