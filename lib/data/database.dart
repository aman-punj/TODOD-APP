import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList = [];



  ///reference our box
  final _myBox = Hive.box('mybox');


  /// first time opening this app
  void createInitialData(){
    toDoList =[
      ['Swipe left to delete' , false ],
      // ['make dinner' , true ],
    ];
  }

  // load the data from database
  void loadData(){
    toDoList = _myBox.get('TODOLIST');
  }

  /// update data base
  void updateDataBase() {
    _myBox.put(('TODOLIST'), toDoList);
    }
}