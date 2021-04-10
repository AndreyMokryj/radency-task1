import 'dart:io';
import 'todolist.dart';
import 'task.dart';

void main() {
  bool exit = false;

  printHelp();

  while (!exit) {
    stdout.write('\$ ');
    String input = stdin.readLineSync();
    String text = input
      .replaceAll(" ", "")
      .replaceFirst("rm", "rm ");

    if(quitCommands.contains(text)) {
      exit = true;
    } else {
      if(text == "ls"){
        for (Task task in tasks){
          print(task.toString());
        }
      }

      if(text.startsWith("add(")){
        List<String> entries =  text.replaceAll("add(", "")
        // .replaceAll(" ", "")
        .replaceAll(", ", ",")
        .replaceAll("),(", ")(")
        .replaceAll(")", "")
        .split("(");

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

      if(text.startsWith("rm ")){
        int id = int.tryParse(text.split(" ")[1]);
        if(id != null){
          ToDoList.removeById(id);
        } else {
          print("ID must be integer!");
          printHelp();
        }
      }

      if(text == "cs"){
        Map map = ToDoList.getCategorySummary();
        map.forEach((key, value) {
          print("Category $key : $value tasks");
        });
      }

      if(helpCommands.contains(text)) {
        printHelp();
      }
    }
  }
}

void printHelp(){
  print('Available commands:');
  print('add(<name>, <category>[, <repeatDay>])[, (<name>, <category>[, <repeatDay>])] – add one or more tasks');
  print('cs – show category summary');
  print('exit – exit app');
  print('help, h – show this message');
  print('ls – show list of tasks');
  print('rm <id> – delete task by id');
  print('quit, q – exit app');
}

final quitCommands = ["exit", "qiut", "q"];

final helpCommands = ["h", "help"];
