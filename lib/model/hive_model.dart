import 'package:hive_flutter/adapters.dart';
import 'package:momentum/momentum.dart';
import 'package:momentum_sample/controller/hive_controller.dart';
import 'package:momentum_sample/main.dart';
import 'package:momentum_sample/model/db/db.dart';

class HiveModel extends MomentumModel<HiveController> {
  Box<Todo> box = Hive.box<Todo>(boxName);
  final Todo? todo;

  HiveModel(HiveController controller, {required this.box, this.todo})
      : super(controller);
  @override
  void update({Todo? todo}) {
    HiveModel(controller, todo: todo, box: box).updateMomentum();
  }
}
