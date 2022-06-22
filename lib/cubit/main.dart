import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit/todo_cubit.dart';
import 'package:todo/cubit/todo_data.dart';
import 'package:todo/cubit/todo_page.dart';

class MyCubitApp extends StatelessWidget {
  const MyCubitApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do:',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(create: (_) => TodoCubit(), child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do:'),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return Center(
            child: Column(children: [
              for (int i = 0; i < state.todoQuests.length; i++)
                todoWidget(state.todoQuests[i], i)
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: BlocProvider.of<TodoCubit>(context), child: TodoPage()),
        )),
        tooltip: 'Add new',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget todoWidget(TodoData todo, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Checkbox(
                    value: todo.completed,
                    onChanged: (val) {
                      BlocProvider.of<TodoCubit>(context).editTodo(
                          todo: todo.turnStatus(completed: !todo.completed),
                          index: i);
                    })),
            const SizedBox(width: 8),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 220,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(todo.title, style: const TextStyle(fontSize: 20)),
                      Text(todo.description,
                          style: const TextStyle(fontSize: 12)),
                    ]),
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<TodoCubit>(context),
                          child: TodoPage(todo: todo, todoIndex: i)),
                    )),
                icon: const Icon(Icons.edit))
          ]),
    );
  }
}
