import 'package:equatable/equatable.dart';

class TaskData extends Equatable {
  const TaskData({this.id = -1, this.title = "title", this.description = "description"});
  final int id;
  final String title;
  final String description;

  @override
  List<Object> get props => [title,description];
}
