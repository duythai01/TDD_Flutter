// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/task.dart';

class TaskState extends Equatable {
   List<Task> allTasks;
   TaskState(
    {
      required this.allTasks,
    }
  );

  @override
    List<Object> get props => [allTasks];

  TaskState copyWith({
    List<Task>? allTasks,
  }) {
    return TaskState(
      allTasks: allTasks ?? this.allTasks,
    );
  }
}
