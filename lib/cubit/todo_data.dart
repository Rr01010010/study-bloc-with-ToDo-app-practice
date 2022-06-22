import 'package:equatable/equatable.dart';

class TodoData extends Equatable {
  const TodoData({this.title = "title", this.description = "description", this.completed = false});
  final String title;
  final String description;
  final bool completed;

  @override
  List<Object> get props => [title];

  TodoData turnStatus({required bool completed}) {
    return TodoData(title: title,description: description, completed: completed);
  }
}
