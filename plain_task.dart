import 'task.dart';

class PlainTask implements Task {
  final int id;
  String name;
  String category;

  PlainTask({this.id, this.name, this.category});

  @override
  String toString() {
    return "Plain Task: id = $id, name = $name, category = $category";
  }
}