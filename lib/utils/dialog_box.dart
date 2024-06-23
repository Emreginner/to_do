import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller ;
   DialogBox({super.key, required this.controller,required this.onCancle,required this.onSaved});
  VoidCallback onSaved;
  VoidCallback onCancle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
         height: 150,
        color: Colors.yellow,
        child:  Column(
           mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
           children: [
              TextField(
                 controller: controller,
                 decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Add a New Task"),
              ),

              Row(
                  children: [
                     MyButton(text: "Save", onPressed: onSaved),
                     SizedBox(width: 10),
                    MyButton(text: "Cancel", onPressed: onCancle )
                    
                    
                  ],

              )


           ],
        ),

      ),
    );

  }
}
