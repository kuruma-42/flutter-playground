/*
DATABASE REPO

This implements the todo repo and handles storing, retrieving, updating, 
deleting in the isar database. 

 */

import 'package:flutter_playground/data/models/isar_todo.dart';
import 'package:flutter_playground/domain/models/todo.dart';
import 'package:flutter_playground/domain/repository/todo_repo.dart';
import 'package:isar/isar.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<void> addTodo(Todo newTodo) async {
    final todoIsar = TodoIsar.fromDomain(newTodo);
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> updateTodo(Todo todo) {
    final todoIsar = TodoIsar.fromDomain(todo);
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
}
