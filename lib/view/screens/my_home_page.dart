import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:momentum_sample/controller/hive_controller.dart';
import 'package:momentum_sample/model/db/db.dart';
import 'package:momentum_sample/model/hive_model.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  String input = '';
  final bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: MomentumBuilder(
        controllers: const [HiveController],
        builder: (context, snapshot) {
          final todoList = snapshot<HiveModel>().box.values.toList();
          return todoList.isNotEmpty
              ? ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox.fromSize(
                      size: const Size(
                        0,
                        5,
                      ),
                    );
                  },
                  itemCount: todoList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final todo = todoList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          showPopup(context, true, key: todo.key, todo: todo);
                        },
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text(
                            todo.task,
                          ),
                          tileColor: Colors.redAccent,
                          trailing: GestureDetector(
                            onTap: () {
                              AlertDialog alert = AlertDialog(
                                title: const Text(
                                  'You sure, want to delete?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Momentum.controller<HiveController>(
                                              context)
                                          .deleteTodo(todo.key, todo);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Yes',
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child:const Text(
                                      'No',
                                    ),
                                  ),
                                ],
                              );
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return alert;
                                },
                              );
                            },
                            child:const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text('Empty'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showPopup(context, false);
        },
        child:const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<void> showPopup(BuildContext context, bool isEdit,
      {int? key, Todo? todo}) {
    final textTheme = Theme.of(context).textTheme;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          title: Text(
            !isEdit ? 'Add Todo' : 'Edit Todo',
            style: textTheme.caption!.copyWith(
              color: Colors.blue,
            ),
          ),
          content: SizedBox(
            height: 130,
            child: Column(
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: ((value) {
                        input = value;
                      }),
                      decoration: InputDecoration(
                        border:const OutlineInputBorder(),
                        hintText: !isEdit ? 'shopping' : todo!.task,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Todo todo = Todo(task: input);
                    !isEdit
                        ? Momentum.controller<HiveController>(context)
                            .addTodo(todo)
                        : Momentum.controller<HiveController>(context)
                            .editTodo(key!, todo);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
