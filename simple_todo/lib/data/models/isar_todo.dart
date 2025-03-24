/*

ISAR TO DO MODEL

Converts todo model into isar todo model that we can store in our isar db.

 */

import 'package:flutter_playground/domain/models/todo.dart';
import 'package:isar/isar.dart';

// to generate isar todo object, run: dart run build_runner build
part 'isar_todo.g.dart';

@Collection()
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // convert isar object -> pure todo object display in our app
  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }

  // convert pure todo object -> isar db
}
