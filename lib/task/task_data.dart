import 'package:equatable/equatable.dart';

class TaskData extends Equatable {
  const TaskData({this.title = "title", this.description = "description", this.completed = false});
  // const TaskData({this.id = -1, this.title = "title", this.description = "description", this.completed = false});
  // final int id;
  final String title;
  final String description;
  final bool completed;

  @override
  List<Object> get props => [title];

  TaskData turnStatus({required bool completed}) {
    print("completed $completed");
    return TaskData(title: title,description: description, completed: completed);
  }
}
