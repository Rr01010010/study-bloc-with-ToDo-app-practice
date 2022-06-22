part of 'tasks_bloc.dart';

//@immutable
//abstract class TasksState {}

class TasksState {

  static List<TaskData> _tasks = [];
  List<TaskData> get tasks => _tasks;


  TasksState newTask(TaskData data) {
    _tasks.add(data);
    return TasksState();
  }
  TasksState deleteTask(int index) {
    if(index >= _tasks.length) return this;
    _tasks.removeAt(index);
    return TasksState();
  }
  TasksState editTask(TaskData data, int index) {
    if(index >= _tasks.length) return this;
    _tasks[index] = data;
    return TasksState();
  }
}
