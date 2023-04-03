import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/database.dart';
import '../utils/dialogue_box.dart';
import '../utils/todo_tile.dart';


class ToDoHome extends StatefulWidget {
  const ToDoHome({Key? key}) : super(key: key);

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {

  /// reference the hive box

  final _myBox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    /// if use is opening  app for the first time
     if(_myBox.get('TODOLIST') == null){

       db.createInitialData();
     } else {
       /// data already exist
       db.loadData();
     }

    super.initState();
  }

  ///text controller
  final _controller = TextEditingController();



  // ///list of task for list builder
  //
  // List toDoList = [
  //   ['make tea', false],
  //   ['goto gym', true],
  //   ['read a book', true],
  // ];

  /// change in check box

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  /// save new task

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  /// delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  /// create a new task

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewTask,
          );

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The ToDo app'),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
