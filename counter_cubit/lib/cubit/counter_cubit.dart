import 'package:flutter_bloc/flutter_bloc.dart';

//we cant use emit on the other page.
class CounterCubit extends Cubit<int> {

  //THIS Part is our initial STATE
  CounterCubit() : super(0);

  //THIS are the methods to change the current state.
  void increment(){
    emit(state + 1);
  }

   void decrement(){
    if(state == 0){
      return;
    }
    emit(state - 1);
  }

    void reset(){
      emit(0);
    }
}
