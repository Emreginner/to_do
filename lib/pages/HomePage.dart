import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/database.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void initState(){

     if(_myBox.get("TODOLİST")== null){
        db.createInitialData();

     }else{
       db.loadData();

     }
     super.initState();
  }

  
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
  final _controller = TextEditingController();





   void checkBoxChanged(bool? value , int index){
       setState(() {
         db.toDoList[index][1] = !db.toDoList[index][1];

       });
      db.updateDataBase();
   }

    void saveNewText(){
     setState(() {
       db.toDoList.add([_controller.text,false]);
       _controller.clear();

     });
     Navigator.of(context).pop();
     db.updateDataBase();

    }


    void createNewTask(){
     showDialog(context: context, builder: (context){
       return DialogBox(
         controller: _controller,
         onSaved:  saveNewText,
         onCancle: ()=> Navigator.of(context).pop(),
       );

     } );

    }
    void deleteTask(int index){
     setState(() {
       db.toDoList.removeAt(index);


     });
     db.updateDataBase();


    }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(

         title: Text("TO DO"),
          elevation: 0,
       ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
        child: Icon(Icons.add),


      ),
      body:

          ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index){
              return TodoTile(taskName: db.toDoList[index][0], taskCompleted: db.toDoList[index][1], onChanged: (value) => checkBoxChanged(value,index), deleteFunction: (context) => deleteTask(index));

            } ,

          ),



      );

  }
}
