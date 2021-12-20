import 'package:flutter/foundation.dart';

class TodoListProvider with ChangeNotifier {
  List<String> _todo = [];
  List<String> get todo {
    return [..._todo];
  }

  void addTodo(value) {
    _todo.add(value);
    notifyListeners();
  }

  void deleteTodo(value) {
    _todo.remove(value);
    notifyListeners();
  }

  void deleteAllTodo() {
    _todo = [];
    notifyListeners();
  }

  void editTodo(index, value) {
    _todo[index] = value;
    notifyListeners();
  }
}
