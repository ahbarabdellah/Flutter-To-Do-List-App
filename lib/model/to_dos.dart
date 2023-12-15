class ToDo {
  String task;
  int? ids;
  bool isDone;

  ToDo({
    required this.ids,
    required this.task,
    this.isDone = false,
  });

  static List<ToDo> toDoList() {
    return [
      ToDo(ids: 01, task: "Take Notes", isDone: true),
      ToDo(ids: 02, task: "Shower"),
      ToDo(ids: 03, task: "Flutter Course"),
      ToDo(ids: 04, task: "Call Ahmed"),
      ToDo(ids: 05, task: "attend Spanish Class"),
      ToDo(ids: 06, task: "Debug Flutter Code"),
      ToDo(ids: 07, task: "Exercice"),
      ToDo(ids: 08, task: "Take Notes", isDone: true),
      ToDo(ids: 09, task: "Shower"),
      ToDo(ids: 10, task: "Flutter Course"),
      ToDo(ids: 11, task: "Call Ahmed"),
      ToDo(ids: 12, task: "attend Spanish Class"),
      ToDo(ids: 13, task: "Debug Flutter Code"),
      ToDo(ids: 14, task: "Exercice"),
      ToDo(ids: 15, task: "Check mail", isDone: true),
    ];
  }
}
