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

      if(input.startsWith("rm ")){
        int id = int.tryParse(input.split(" ")[1]);
        if(id != null){
          ToDoList.removeById(id);
        } else {
          print("ID must be integer!");
        }
      }
    }
  }
}

final quitCommands = ["exit", "qiut", "q"];
