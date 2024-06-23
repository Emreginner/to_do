import 'package:hive/hive.dart';

class ToDoDatabase{

    List toDoList= [];

    final _myBox = Hive.box('mybox');

    // run this method if this the 1st time ever opening this app
    void createInitialData(){
        toDoList=[
            ["Yemek yap", false],
            ["Ders Çalış", false]
        ];
}
  void loadData(){
        toDoList = _myBox.get("TODOLİST");

}
  void updateDataBase(){
        _myBox.put("TODOLİST", toDoList);

  }

}