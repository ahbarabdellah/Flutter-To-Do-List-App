import 'package:flutter/material.dart';
import 'package:todoapp/colors/app_colors.dart';

class ToDoItem extends StatelessWidget {
  final List todo;
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
          todo[2] ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blueAccent,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          todo[1],
          style: TextStyle(
              decoration: todo[2] ? TextDecoration.lineThrough : null),
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
