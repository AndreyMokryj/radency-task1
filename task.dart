abstract class Task {
  final int id;
  String name;
  String category;

  Task({this.id, this.name, this.category});

  @override
  String toString() {
    return "Task: id = $id, name = $name, category = $category";
  }
}