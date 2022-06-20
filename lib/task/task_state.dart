part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState({TaskData? data}) : _data = data ?? const TaskData();

  final TaskData _data;
  TaskData get getData => _data;

  //ToDoTaskState newState(ToDoTaskEvent event);

  @override
  List<Object> get props => [_data];
}

class ActiveTaskState extends TaskState {}
class CompetedTaskState extends TaskState {}
