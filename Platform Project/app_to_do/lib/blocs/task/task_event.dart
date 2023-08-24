// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import '../../data/models/task.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final Task task;
  const AddTaskEvent({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTaskEvent extends TaskEvent {
  final Task task;
  final int taskId;
  const UpdateTaskEvent({
    required this.task,
    required this.taskId,
  });
  @override
  List<Object> get props => [task, taskId];
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;
    final int taskId;
  const DeleteTaskEvent( {
    required this.task,
  required this.taskId,
  });
  @override
  List<Object> get props => [task, taskId];
}

class GetAllTaskEvent extends TaskEvent {
  @override
  List<Object> get props => [];
}
