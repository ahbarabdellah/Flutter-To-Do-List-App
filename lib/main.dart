import 'package:flutter/material.dart';
import 'package:todo/colors/AppColors.dart';
import 'package:todo/model/to_dos.dart';
import 'package:todo/widgets/todo_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todoslist = ToDo.toDoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.floralWhite,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const SearchBox(),
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
                    for (ToDo todo in todoslist) ToDoItem(todo: todo),
                  ],
                ),
              ),
            ),
            Align(
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
                                  .withOpacity(
                                      0.3), // Shadow color with opacity
                              spreadRadius: 3, // Spread radius
                              blurRadius: 3, // Blur radius
                              offset:
                                  Offset(0, 0), // Changes position of shadow
                            ),
                          ],
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: const TextField(
                        decoration: InputDecoration(
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
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 68, 138, 255)
                                      .withOpacity(
                                          0.3), // Shadow color with opacity
                                  spreadRadius: 3, // Spread radius
                                  blurRadius: 3, // Blur radius
                                  offset: const Offset(
                                      0, 0), // Changes position of shadow
                                ),
                              ],
                              color: const Color.fromARGB(255, 68, 138, 255),
                              borderRadius: BorderRadius.circular(5)),
                          width: 50,
                          height: 50,
                          child: const Icon(Icons.add))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0)
                  .withOpacity(0.3), // Shadow color with opacity
              spreadRadius: 3, // Spread radius
              blurRadius: 3, // Blur radius
              offset: const Offset(0, 0), // Changes position of shadow
            ),
          ],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: const TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            border: InputBorder.none),
      ),
    );
  }
}

AppBar buildAppBar() {
  return (AppBar(
    backgroundColor: AppColors.floralWhite,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu),
        const Text('To-Do'),
        SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            child: Image.network(
                "https://pfpmaker.com/_nuxt/img/martin.f86f81e.webp"),
          ),
        )
      ],
    ),
  ));
}
