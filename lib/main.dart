import 'package:flutter/material.dart';
import 'package:prak_tugas2/listmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.greenAccent,
      ),
      home: ListMenu(),
    );
  }
}