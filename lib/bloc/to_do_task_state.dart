part of 'to_do_task_bloc.dart';

abstract class ToDoTaskState extends Equatable {
  const ToDoTaskState({TaskData? data}) : _data = data ?? const TaskData();

  final TaskData _data;
  TaskData get getData => _data;

  //ToDoTaskState newState(ToDoTaskEvent event);

  @override
  List<Object> get props => [_data];
}

class ActiveTaskState extends ToDoTaskState {}
class CompetedTaskState extends ToDoTaskState {}
