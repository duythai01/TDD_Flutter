import 'package:flutter/rendering.dart';

import '../models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskRepository {
 final Box<Task> _taskBox;
  TaskRepository({required Box<Task> taskBox}) : _taskBox = taskBox;

  Future<void> addTask(Task task) async {
    await _taskBox.add(task);
  }

  List<Task>? getAllTasks() {
    return _taskBox.values.toList();
  }

  Task? getAt(int index) {
    return _taskBox.getAt(index);
  }

  Task? getTaskById(int id) {
    return _taskBox.values.firstWhere((task) => task.id == id);
  }

  void updateTask(int index, Task task) {
    _taskBox.putAt(index, task);
  }
}
