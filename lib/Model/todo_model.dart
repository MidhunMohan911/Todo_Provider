class TodoField {
  static const createdTime = 'createTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String discription;
  bool isDone;
  Todo(
      {required this.createdTime,
      required this.title,
      this.discription = '',
      this.id = '',
      this.isDone = false});
}
