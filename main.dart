import 'dart:io';
import 'package:args/args.dart';

main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser()
    ..addOption('zip', abbr: 'z')
    ..addOption('country', abbr: 'c', defaultsTo: 'de')
    // ..addCommand('add')
  ;

  final argResults = parser.parse(arguments);

  print(argResults['zip']);
  print(arguments[0]);
  // weatherCli(argResults['zip'], argResults['country']);
}