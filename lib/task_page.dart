import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task/task_data.dart';
import 'package:todo/tasks_bloc/tasks_bloc.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key, this.taskIndex, this.task}) {
    titleController.text = task?.title ?? "";
    descriptionController.text = task?.description ?? "";
  }

  final int? taskIndex;
  final TaskData? task;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do:'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ...form("Title : ", titleController),
          ...form("Description : ", descriptionController),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<TasksBloc>(context).add(
                    taskIndex == null
                        ? NewTaskEvent(
                            newTask: TaskData(
                              title: titleController.text,
                              description: descriptionController.text,
                            ),
                          )
                        : EditTaskEvent(
                            taskIndex: taskIndex!,
                            newTask: TaskData(
                              title: titleController.text,
                              description: descriptionController.text,
                              completed: task?.completed ?? false,
                            ),
                          ),
                  );
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.grey),
                  foregroundColor: MaterialStateProperty.all(Colors.white24),
                  backgroundColor: MaterialStateProperty.all(Colors.white24),
                  shadowColor: MaterialStateProperty.all(Colors.grey),
                ),
                child: Text("Save", style: textStyle),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: taskIndex == null
          ? null
          : FloatingActionButton(
              onPressed: () {
                BlocProvider.of<TasksBloc>(context)
                    .add(DeleteTaskEvent(taskIndex: taskIndex!));
                Navigator.of(context).pop();
              },
              tooltip: 'Delete',
              child: const Icon(Icons.delete_outline),
            ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> form(String header, TextEditingController controller) {
    return [
      const SizedBox(height: 8),
      Text(header, style: textStyle),
      TextField(controller: controller, style: textStyle),
    ];
  }

  TextStyle get textStyle => const TextStyle(
      fontSize: 18, color: Colors.deepPurple, fontWeight: FontWeight.w600);
}
