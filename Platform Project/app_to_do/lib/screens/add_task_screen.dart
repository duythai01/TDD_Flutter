// ignore_for_file: camel_case_types

import 'package:app_to_do/blocs/bloc_export.dart';
import 'package:flutter/material.dart';

import '../blocs/task/task_event.dart';
import '../data/models/task.dart';

class add_task_screen extends StatelessWidget {
  const add_task_screen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text("Add a task"),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                var task = Task(title: titleController.text);
                context.read<TaskBloc>().add(AddTaskEvent(task: task));
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ])
        ],
      ),
    );
  }
}
