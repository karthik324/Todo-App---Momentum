import 'package:hive_flutter/adapters.dart';
import 'package:momentum/momentum.dart';
import 'package:momentum_sample/main.dart';
import 'package:momentum_sample/model/db/db.dart';
import 'package:momentum_sample/model/hive_model.dart';

class HiveController extends MomentumController<HiveModel> {
  @override
  HiveModel init() {
    model = HiveModel(this, box: Hive.box<Todo>(boxName));
    return model;
  }

  @override
  late HiveModel model;

  void addTodo(Todo todo) {
    model.box.add(todo);
    model.update(todo: todo);
  }

  void deleteTodo(int key, Todo todo) {
    model.box.delete(key);
    model.update(todo: todo);
  }

  void editTodo(int key, Todo todo) {
    model.box.put(key, todo);
    model.update(todo: todo);
  }
}
