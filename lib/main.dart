import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task/task_data.dart';
import 'package:todo/task_page.dart';
import 'package:todo/tasks_bloc/tasks_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do:',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(create: (_) => TasksBloc(), child: const MyHomePage()),
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
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return Center(
            child: Column(children: [
              for (int i = 0; i < state.tasks.length; i++)
                todoWidget(state.tasks[i], i)
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: BlocProvider.of<TasksBloc>(context), child: TaskPage()),
        )),
        tooltip: 'Add new',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget todoWidget(TaskData task, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Checkbox(
                    value: task.completed,
                    onChanged: (val) {
                      BlocProvider.of<TasksBloc>(context).add(EditTaskEvent(
                          newTask: task.turnStatus(completed: !task.completed),
                          taskIndex: i));
                    })),
            const SizedBox(width: 8),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 220,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title, style: const TextStyle(fontSize: 20)),
                      Text(task.description,
                          style: const TextStyle(fontSize: 12)),
                    ]),
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<TasksBloc>(context),
                          child: TaskPage(task: task, taskIndex: i)),
                    )),
                icon: const Icon(Icons.edit))
          ]),
    );
  }
}
