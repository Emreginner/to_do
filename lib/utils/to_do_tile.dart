import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
   final String taskName;
   final bool taskCompleted;
   Function(bool?)? onChanged;
   Function(BuildContext)? deleteFunction;
  TodoTile({super.key, required this.taskName, required this.taskCompleted,required this.onChanged,required this.deleteFunction});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 25.0,left: 25.0,top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: deleteFunction ,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade300,
          borderRadius: BorderRadius.circular(2),)

        ]),
        child: Container(
          padding: EdgeInsets.all(24),
            child: Row(
              children: [

                Checkbox(value: taskCompleted, onChanged: onChanged,
                activeColor: Colors.black,
                ),

                Text(taskName,style:  TextStyle(
                  decoration: taskCompleted ?  TextDecoration.lineThrough: TextDecoration.none
                ),),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
                  borderRadius: BorderRadius.circular(12)
            ),




        ),
      ),
    );
  }
}
