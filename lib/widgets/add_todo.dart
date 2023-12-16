import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';

class AddToDo extends StatefulWidget {
  final TextEditingController addtodocontroller;
  final List todos;
  final void Function()? addTodo2todolist;
  const AddToDo(
      {super.key,
      required this.addtodocontroller,
      required this.todos,
      required this.addTodo2todolist});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 0, 0, 0)
                          .withOpacity(0.3), // Shadow color with opacity
                      spreadRadius: 3, // Spread radius
                      blurRadius: 3, // Blur radius
                      offset: const Offset(0, 0), // Changes position of shadow
                    ),
                  ],
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: TextField(
                controller: widget.addtodocontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add),
                    hintText: "Add a Task",
                    border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: widget.addTodo2todolist,
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 68, 138, 255)
                              .withOpacity(0.3), // Shadow color with opacity
                          spreadRadius: 3, // Spread radius
                          blurRadius: 3, // Blur radius
                          offset:
                              const Offset(0, 0), // Changes position of shadow
                        ),
                      ],
                      color: const Color.fromARGB(255, 68, 138, 255),
                      borderRadius: BorderRadius.circular(5)),
                  width: 50,
                  height: 50,
                  child: const Icon(Icons.add))),
        ],
      ),
    );
  }
}
