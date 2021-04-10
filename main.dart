import 'dart:io';
import 'todolist.dart';
import 'task.dart';

void main() {
  bool exit = false;

  stdout.writeln('Available commands:');
  stdout.writeln('ls – get list of tasks');
  stdout.writeln('exit, quit, q – exit app');

  while (!exit) {
    stdout.write('\$ ');
    String input = stdin.readLineSync();

    if(quitCommands.contains(input)) {
      exit = true;
    } else {
      if(input == "ls"){
        for (Task task in tasks){
          print(task.toString());
        }
      }

      if(input.startsWith("add (")){
        List<String> entries =  input.replaceAll("add (", "")
        .replaceAll(" ", "")
        .replaceAll(", ", ",")
        .replaceAll("),(", ")(")
        .replaceAll(")", "")
        .split("(");
        // print(entries[0]);
        // print(entries[1]);

        List<Map> maps = [];
        entries.forEach((element) {
          List<String> vaues = element.split(",");
          maps.add({
            "name" : vaues[0],
            "category" : vaues[1],
            "repeat" : vaues.length > 2 ? vaues[2] : null,
          });
        });

        ToDoList.addAll(maps);
      }

      if(input.startsWith("rm ")){
        int id = int.tryParse(input.split(" ")[1]);
        if(id != null){
          ToDoList.removeById(id);
        } else {
          print("Incorrect command!");
        }
      }

      if(input == "cs"){
        Map map = ToDoList.getCategorySummary();
        map.forEach((key, value) {
          print("Category $key : $value tasks");
        });
      }
    }
  }
}

final quitCommands = ["exit", "qiut", "q"];
