import 'package:flutter/material.dart';
import 'package:todo_app/provider/todo_list.dart';
import 'package:todo_app/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoListProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Home(),
      ),
    );
  }
}
