import 'task.dart';
import 'plain_task.dart';
import 'recurring_task.dart';

List<Task> tasks = [
  PlainTask(id: 0, name: "Plain task 1", category: "Category A"),
  PlainTask(id: 1, name: "Plain task 2", category: "Category B"),
  RecurringTask(id: 2, name: "Recurring task 1", category: "Category A", dayOfWeek: DayOfWeek.MONDAY),
  RecurringTask(id: 3, name: "Recurring task 2", category: "Category C", dayOfWeek: DayOfWeek.FRIDAY),
];

int count = tasks.length;

class ToDoList {
  static List<Task> getTasks(){
    return tasks;
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