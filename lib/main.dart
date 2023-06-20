import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'app_observer/observer.dart';
import 'application/blocs_export.dart';

import 'screens/tasks/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  // Directory tempDir = await getTemporaryDirectory();
  // final temp_Path = tempDir.path;
  // print("temp_path: $temp_Path");

  // Directory appDir = await getApplicationDocumentsDirectory();
  // final appPath = appDir.path;
  // print("app_path: $appPath");
  Bloc.observer = AppObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TasksScreen(),
      ),
    );
  }
}
