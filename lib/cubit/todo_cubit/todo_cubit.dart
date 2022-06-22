import 'package:bloc/bloc.dart';
import 'package:todo/cubit/todo_data.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState());


  void newTodo({required TodoData todo}) {
    print("NEW TODO $todo");
    state.todoQuests.add(todo);
    emit(TodoState());
  }
  void deleteTodo({required int index}) {
    if(index >= state.todoQuests.length) return;
    state.todoQuests.removeAt(index);
    emit(TodoState());
  }
  void editTodo({required TodoData todo, required int index}) {
    if(index >= state.todoQuests.length) return;
    state.todoQuests[index] = todo;
    emit(TodoState());
  }
}
