class ToDo {
  String? id;
  String todoText;
  late bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: '01', todoText: 'Check Mall', isDone: true),
      ToDo(id: '02', todoText: 'Learn Flutter', isDone: true),
      ToDo(id: '03', todoText: 'Team Meeting', isDone: false),
      ToDo(id: '04', todoText: 'Work on PC', isDone: false),
      ToDo(id: '05', todoText: 'Dinner', isDone: true),
    ];
  }
}