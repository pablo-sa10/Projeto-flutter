import 'package:flutter/material.dart';
import 'package:projeto_dart/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task("Aprender Flutter", "assets/images/bird.jpg", 1),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
    Task("Aprender Flutter", "assets/images/bird.jpg", 3),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
