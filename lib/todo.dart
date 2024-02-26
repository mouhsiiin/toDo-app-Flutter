class ToDo {
  int id;
  String title;
  bool isDone;

  ToDo({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
  static List<ToDo> toDoList = [
    ToDo(title: "Buy Groceries", id: 1),
    ToDo(title: "do home work", id: 2),
    ToDo(title: "check emails", id: 3),
    ToDo(title: "play a game", id: 4),
    ToDo(title: "read a book", id: 5),
    ToDo(title: "go for a walk", id: 6),
    ToDo(title: "watch a movie", id: 7),
    ToDo(title: "call mom", id: 8),
    ToDo(title: "watch a movie", id: 9),
    ToDo(title: "call mom", id: 10),
  ];

  static List<ToDo> resList = toDoList ;
}