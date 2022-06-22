import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit/todo_cubit.dart';
import 'package:todo/cubit/todo_data.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key, this.todoIndex, this.todo}) {
    titleController.text = todo?.title ?? "";
    descriptionController.text = todo?.description ?? "";
  }

  final int? todoIndex;
  final TodoData? todo;
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ...form("Title : ", titleController),
          ...form("Description : ", descriptionController),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  todoIndex == null
                      ? BlocProvider.of<TodoCubit>(context).newTodo(
                          todo: TodoData(
                          title: titleController.text,
                          description: descriptionController.text,
                        ))
                      : BlocProvider.of<TodoCubit>(context).editTodo(
                          index: todoIndex!,
                          todo: TodoData(
                            title: titleController.text,
                            description: descriptionController.text,
                            completed: todo?.completed ?? false,
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
      floatingActionButton: todoIndex == null
          ? null
          : FloatingActionButton(
              onPressed: () {
                if(todoIndex==null) return;

                BlocProvider.of<TodoCubit>(context).deleteTodo(index: todoIndex!);

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
