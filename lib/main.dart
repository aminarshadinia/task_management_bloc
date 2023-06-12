import 'package:flutter/material.dart';
import 'package:task_management_bloc/models/task.dart';
import 'application/blocs_export.dart';

import 'package:task_management_bloc/app_observer/observer.dart';

import 'screens/tasks/tasks_screen.dart';

void main() {
  Bloc.observer = AppObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(
          AddTask(
            task: Task(title: 'Task test'),
          ),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
