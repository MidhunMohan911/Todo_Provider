import 'package:flutter/material.dart';
import 'package:todo_firebase/Model/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todo = [
    Todo(createdTime: DateTime.now(), title: 'Buy Food', discription: '''  
    - Eggs
    - Milk
    - Bread
    - Water'''),
    Todo(
        createdTime: DateTime.now(), title: 'Plan Family Trip', discription: '''
    - Rent Some Hotel
    - Rent a Car
    - Pack Suitcase
    '''),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the Dog',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan Jithus Birthday Party',
    ),
  ];
  List<Todo> get todos => _todo.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todo.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todo.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todo.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String discription) {
    todo.title = title;
    todo.discription = discription;
    notifyListeners();
  }
}
