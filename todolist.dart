import 'task.dart';
import 'plain_task.dart';
import 'recurring_task.dart';

List<Task> tasks = [
  PlainTask(id: 0, name: "Plain task 1", category: "A"),
  PlainTask(id: 1, name: "Plain task 2", category: "B"),
  RecurringTask(id: 2, name: "Recurring task 1", category: "A", dayOfWeek: DayOfWeek.MONDAY),
  RecurringTask(id: 3, name: "Recurring task 2", category: "C", dayOfWeek: DayOfWeek.FRIDAY),
];

int count = tasks.length;

class ToDoList {
  static List<Task> getTasks(){
    return tasks;
  }

  static void add(Map map){
    final int id = count;
    count++;

    final name = map['name']  ?? "Not specified";
    final category = map['category'] ?? "Not specified";
    final day = map['repeat'];

    DayOfWeek dayOfWeek;

    if(day != null) {
      switch (day.toUpperCase()) {
        case "MONDAY" :
          dayOfWeek = DayOfWeek.MONDAY;
          break;
        case "TUESDAY" :
          dayOfWeek = DayOfWeek.TUESDAY;
          break;
        case "WEDNESDAY" :
          dayOfWeek = DayOfWeek.WEDNESDAY;
          break;
        case "THURSDAY" :
          dayOfWeek = DayOfWeek.THURSDAY;
          break;
        case "FRIDAY" :
          dayOfWeek = DayOfWeek.FRIDAY;
          break;
        case "SATURDAY" :
          dayOfWeek = DayOfWeek.SATURDAY;
          break;
        case "SUNDAY" :
          dayOfWeek = DayOfWeek.SUNDAY;
          break;
      }
    }

    if(dayOfWeek == null){
      tasks.add(PlainTask(
        id: id,
        name: name,
        category: category,
      ));
    } else {
      tasks.add(RecurringTask(
        id: id,
        name: name,
        category: category,
        dayOfWeek: dayOfWeek,
      ));
    }
  }

  static void addAll(List<Map> maps){
    maps.forEach((element) {
      add(element);
    });
  }

  static void removeById(int id){
    tasks.removeWhere((element) => element.id == id);
  }

  static Map<String, int> getCategorySummary(){
    Map<String, int> categories = {};
    for(Task task in tasks){
      String key = task.category;
      if(categories.containsKey(key)){
        categories[key]++;
      } else {
        categories[key] = 1;
      }
    }

    return categories;
  }
}