import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ Key key }) : super(key: key);
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  
  Widget build(BuildContext context) {
    var output = "";
    final List lst = [24,66,55];
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text('Add Item'),
              content: TextField(
                onChanged: (value){
                  output = value;
                },
              ),
            );
          });
        },
      ),
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context,index){
          return Container(
            height: 60,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text('${lst[index]}'),
              trailing: Row(
                children: [
                  Icon(Icons.edit),
                  Icon(Icons.delete),
                ],

              ),
            ),
          );
        },
      ),
    ),
    );
  }
}