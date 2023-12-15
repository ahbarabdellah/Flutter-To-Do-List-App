import 'package:flutter/material.dart';
import 'package:todo/colors/AppColors.dart';
import 'package:todo/model/to_dos.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  const ToDoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        tileColor: Colors.white,
        onTap: () {
          print("tile");
        },
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: AppColors.eerieBlack,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          todo.task,
          style: TextStyle(
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: GestureDetector(
          onTap: () {
            print("Icon");
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
