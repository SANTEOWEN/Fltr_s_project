import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/models/todo_models.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if(title.isEmpty){
      addError('LAMAW! add some shit');
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    emit([...state, todo]);
  }

  //This shows up some changes from the inputs
  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print('TodoCubit $change');
  }

  //This shows up some erros if we found out some problems
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('todocubit $error');
  }
}
