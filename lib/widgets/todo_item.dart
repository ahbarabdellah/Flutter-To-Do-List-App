import 'package:flutter/material.dart';
import 'package:todo/colors/AppColors.dart';
import 'package:todo/model/to_dos.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function marktodo;
  final Function deleteTodo;
  const ToDoItem(
      {super.key,
      required this.todo,
      required this.marktodo,
      required this.deleteTodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        tileColor: Colors.white,
        onTap: () {
          marktodo(todo);
        },
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blueAccent,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          todo.task,
          style: TextStyle(
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: GestureDetector(
          onTap: () {
            deleteTodo(todo);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: AppColors.flame,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
