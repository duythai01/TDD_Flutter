import 'package:app_to_do/blocs/bloc_export.dart';
import 'package:app_to_do/blocs/task/task_event.dart';
import 'package:app_to_do/blocs/task/task_state.dart';
import 'package:flutter/material.dart';

import '../data/models/task.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return task_tile(task: task, index: index);
          }),
    );
  }
}


