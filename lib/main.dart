import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'pages/HomePage.dart';

void main() async{

  // init the hive
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         theme:  ThemeData(primaryColor: Colors.yellow[600],primarySwatch: Colors.yellow),
        debugShowCheckedModeBanner:  false,
        home:  HomePage(),


    );
  }
}
