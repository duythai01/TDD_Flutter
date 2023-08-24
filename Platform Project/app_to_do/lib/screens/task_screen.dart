import 'package:app_to_do/blocs/bloc_export.dart';
import 'package:app_to_do/blocs/task/task_state.dart';
import 'package:app_to_do/data/models/task.dart';
import 'package:app_to_do/screens/my_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);
  static const id = "TaskScreen";

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const add_task_screen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> tasks = state.allTasks;
      return Scaffold(
        appBar: AppBar(
          title: const Text("To do app"),
          actions: [
            IconButton(
                onPressed: () => _addTask(context), icon: const Icon(Icons.add))
          ],
        ),
        drawer: MyDrawer(),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Chip(label: Text("${tasks.length} Tasks")),
          ),
          TasksList(tasks: tasks)
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addTask(context),
          tooltip: "Add tasks",
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
