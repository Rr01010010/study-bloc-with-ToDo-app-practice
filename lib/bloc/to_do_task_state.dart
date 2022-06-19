part of 'to_do_task_bloc.dart';

class ToDoTaskState extends Equatable {
  ToDoTaskState({TaskData? data, this.taskState = ToDoTaskEvent.todo}) : _data = data ?? const TaskData();

  final TaskData _data;
  ToDoTaskEvent taskState;

  ToDoTaskState newState(ToDoTaskEvent newState) {
    return ToDoTaskState(data: _data, taskState: newState);
  }

  @override
  List<Object> get props => [_data,taskState];
}
