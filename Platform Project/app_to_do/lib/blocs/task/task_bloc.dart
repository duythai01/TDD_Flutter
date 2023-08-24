// ignore_for_file: depend_on_referenced_packages

import 'package:app_to_do/blocs/task/task_event.dart';
import 'package:app_to_do/blocs/task/task_state.dart';
import 'package:app_to_do/data/models/task.dart';
import 'package:app_to_do/data/repository/task_repository.dart';
import 'package:bloc/bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc({required this.taskRepository}) : super(TaskState(allTasks: [])) {
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<GetAllTaskEvent>(_onGetAllTask);
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    await taskRepository.addTask(event.task);
    final tasks = taskRepository.getAllTasks();
    emit(TaskState(allTasks: tasks ?? []));
  }

  Future<void> _onUpdateTask(
      UpdateTaskEvent event, Emitter<TaskState> emit) async {
    final taskEvent = event.task;
    final updateTask = taskEvent.copyWith(isDone: !(taskEvent.isDone ?? true));
    taskRepository.updateTask(event.taskId, updateTask);
    final tasks = taskRepository.getAllTasks();
    emit(TaskState(allTasks: tasks ?? []));
  }
  Future<void> _onDeleteTask(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    // final taskEvent = event.task;
    final task = taskRepository.getAt(event.taskId);

    if (task != null) {
      await task.delete();
    }
    final tasks = taskRepository.getAllTasks();
    emit(TaskState(allTasks: tasks ?? []));
  }

  void _onGetAllTask(GetAllTaskEvent event, Emitter<TaskState> emit) async {
    final tasks = taskRepository.getAllTasks();
    emit(TaskState(allTasks: tasks ?? []));
  }
}
