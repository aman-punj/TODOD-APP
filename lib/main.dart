import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_to_do_app/todo_home.dart';

void main()  async {
 /// init the hive

  await Hive.initFlutter();

  ///open a box
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo app',
     debugShowCheckedModeBanner: false,
     home: ToDoHome(),
    );
  }
}
