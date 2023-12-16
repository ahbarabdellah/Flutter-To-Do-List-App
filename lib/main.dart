import 'package:flutter/material.dart';
import 'package:todoapp/colors/app_colors.dart';
import 'package:todoapp/widgets/add_todo.dart';
import 'package:todoapp/widgets/build_app_bar.dart';
import 'package:todoapp/widgets/search_box.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widgets/todo_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 88, 107, 139)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var db = MyData();
  List todoslist = [];

  final TextEditingController addtodocontroller = TextEditingController();
  final TextEditingController searchKeyword = TextEditingController();

  var _foundToDo = [];

  @override
  void initState() {
    List todoslist = db.loadData();
    _foundToDo = todoslist;
    super.initState();
  }

  @override
  void dispose() {
    addtodocontroller.dispose();
    searchKeyword.dispose();
    super.dispose();
  }

  void _runFilter(String searchKeyword) {
    setState(() {
      if (searchKeyword.isEmpty) {
        _foundToDo = todoslist;
      } else {
        _foundToDo = todoslist
            .where((element) =>
                element[1].toLowerCase().contains(searchKeyword.toLowerCase()))
            .toList();
      }
    });
  }

  void marktodo(List todo) {
    setState(() {
      todo[2] = !todo[2];
    });
    db.updateData(todoslist);
  }

  void deletetodo(todo) {
    setState(() {
      todoslist.remove(todo);
      _foundToDo.remove(todo);
    });
    db.updateData(todoslist);
  }

  void addTodo2todolist() {
    if (addtodocontroller.text.trim().isNotEmpty) {
      int id = 0;
      if (todoslist.isNotEmpty) {
        id = todoslist.last[0] + 1;
      } else {
        id = 1;
      }

      setState(() {
        todoslist.add([id, addtodocontroller.text.trim(), false]);
        addtodocontroller.clear();
      });
      db.updateData(todoslist);
    } else {
      var snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Please enter a task ! ',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.floralWhite,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SearchBox(searchKeyword: searchKeyword, onChanged: _runFilter),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          "All To-Dos",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    for (List todo in _foundToDo.reversed)
                      ToDoItem(
                        todo: todo,
                        marktodo: marktodo,
                        deleteTodo: deletetodo,
                      ),
                  ],
                ),
              ),
            ),
            AddToDo(
                addtodocontroller: addtodocontroller,
                todos: todoslist,
                addTodo2todolist: addTodo2todolist)
          ],
        ),
      ),
    );
  }
}
