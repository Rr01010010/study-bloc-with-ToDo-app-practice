part of 'tasks_bloc.dart';

abstract class TasksEvent {}

class NewTaskEvent extends TasksEvent {
  NewTaskEvent({required this.newTask});
  final TaskData newTask;
}

class DeleteTaskEvent extends TasksEvent {
  DeleteTaskEvent({required this.taskIndex});
  final int taskIndex;
}

class EditTaskEvent extends TasksEvent {
  EditTaskEvent({required this.newTask, required this.taskIndex});
  final int taskIndex;
  final TaskData newTask;
}

