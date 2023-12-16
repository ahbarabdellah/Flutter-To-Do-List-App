import 'package:hive_flutter/hive_flutter.dart';

class MyData {
  var box = Hive.box('todoBox');

  List initialTodos = [
    [1, "take a courses", false],
    [2, "take a Shower", false]
  ];

  var todolis = [];

  List<dynamic> loadData() {
    if (box.get('todos') != null) {
      todolis = box.get('todos');
    } else {
      todolis = initialTodos;
    }

    return todolis;
  }

  void updateData(var todoList) {
    box.put('todos', todoList);
  }
}
