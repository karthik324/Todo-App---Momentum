import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:momentum/momentum.dart';
import 'package:momentum_sample/controller/hive_controller.dart';
import 'package:momentum_sample/model/db/db.dart';

import 'app.dart';

String boxName = 'box';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>(boxName);
  runApp(
    Momentum(
      controllers: [HiveController()],
      child: const MyApp(),
    ),
  );
}
