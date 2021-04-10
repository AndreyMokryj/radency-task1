import 'dart:io';
import 'todolist.dart';

void main() {
  bool exit = false;

  stdout.writeln('Available commands:');
  stdout.writeln('ls – get list of tasks');
  stdout.writeln('exit, quit, q – exit app');

  while (!exit) {

    String input = stdin.readLineSync();
    if(quitCommands.contains(input)) {
      exit = true;
    } else {
      if(input == "ls"){
        ToDoList.showList();
      }

      // stdout.writeln('You typed: $input');
    }
  }
}

final quitCommands = ["exit", "qiut", "q"];
