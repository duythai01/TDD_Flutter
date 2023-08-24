import 'package:app_to_do/blocs/bloc_export.dart';
import 'package:app_to_do/blocs/task/task_event.dart';
import 'package:app_to_do/data/repository/task_repository.dart';
import 'package:app_to_do/service/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'data/models/task.dart';
import 'screens/task_screen.dart';

// void main() => runApp(
//    WidgetsFlutterBinding.ensureInitialized();
//   final appDocumentDirectory = await getApplicationDocumentsDirectory();
//   Hive.init(appDocumentDirectory.path);
//   await Hive.openBox<Task>('tasks');
//   const MyApp()
//   );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks');

  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  final box = Hive.box<Task>('tasks');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskBloc(taskRepository: TaskRepository(taskBox: box))
            ..add(GetAllTaskEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
