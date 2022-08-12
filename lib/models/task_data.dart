import 'package:flutter/foundation.dart';
import 'package:todo_app/models/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier{
 final List<Task> _tasks = [
    Task(name: "ToDo's", isDone: false),
    // Task(name: 'Buy Eggs', isDone: false),
    // Task(name: 'Buy Chicken', isDone: false),
  ];
 late SharedPreferences prefs;


  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskLength{
    return _tasks.length;
  }

  void addTask(String newTaskEdit){
    final task = Task(name: newTaskEdit);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}