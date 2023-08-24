import 'package:flutter/material.dart';

import '../blocs/bloc_export.dart';
import '../blocs/task/task_event.dart';
import '../data/models/task.dart';

class task_tile extends StatelessWidget {
  const task_tile({
    super.key,
    required this.task,
    required this.index,
  });

  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration:
                (task.isDone ?? false) ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
            value: task.isDone,
            onChanged: (value) => context
                .read<TaskBloc>()
                .add(UpdateTaskEvent(task: task.copyWith(), taskId: index))),
        onLongPress: () => context
            .read<TaskBloc>()
            .add(DeleteTaskEvent(task: task, taskId: index)));
  }
}