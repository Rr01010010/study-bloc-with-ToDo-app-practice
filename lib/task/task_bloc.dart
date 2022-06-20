import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task/task_data.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(ActiveTaskState()) {
    on<TaskEvent>((event, emit) {
      switch(event) {
        case TaskEvent.active: emit(ActiveTaskState()); break;
        case TaskEvent.completed: emit(CompetedTaskState()); break;
      }
      //emit(state.newState(event));
    });
  }
}
