import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task_data.dart';

part 'to_do_task_event.dart';
part 'to_do_task_state.dart';

class ToDoTaskBloc extends Bloc<ToDoTaskEvent, ToDoTaskState> {
  ToDoTaskBloc() : super(ToDoTaskState()) {
    on<ToDoTaskEvent>((event, emit) {
      switch(event) {
        case ToDoTaskEvent.todo: break;
        case ToDoTaskEvent.completed: break;
      }
      emit(state.newState(event));
    });
  }
}
