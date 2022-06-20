import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task/task_data.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<TasksEvent>((event, emit) {
      print("new event - ${event.runtimeType}");

      if(event is NewTaskEvent) {
        emit(state.newTask(event.newTask));
      } else if(event is DeleteTaskEvent) {
        emit(state.deleteTask(event.taskIndex));
      }
      else if(event is EditTaskEvent) {
        emit(state.editTask(event.newTask,event.taskIndex));
      }
      else {
        print("Не обработанный эвент \"${event.runtimeType}\" в TasksBloc.dart");
      }
    });
  }
}
