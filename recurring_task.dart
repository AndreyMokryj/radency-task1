import 'task.dart';

class RecurringTask implements Task {
  final int id;
  String name;
  String category;
  DayOfWeek dayOfWeek;

  RecurringTask({this.id, this.name, this.category, this.dayOfWeek});

  @override
  String toString() {
    return "Recurring Task: id = $id, name = $name, category = $category, repeat each ${dayOfWeek.toString().substring(10)}";
  }
}

enum DayOfWeek{SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY}