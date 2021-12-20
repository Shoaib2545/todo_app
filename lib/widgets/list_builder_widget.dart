import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/add_todos.dart';

class TodoListWidget extends StatefulWidget {
  final int? index;
  final String? todoText;
  final Function? deleteFunction;
  const TodoListWidget(
      {Key? key, this.todoText, this.deleteFunction, this.index})
      : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  void editTodos(context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return AddTodos(
            index: widget.index,
            textTodos: widget.todoText,
          );
        });
  }

  @override
  void initState() {
    super.initState();
    color = colorList[Random().nextInt(colorList.length)];
  }

  List<Color> colorList = [
    Colors.amber,
    Colors.blue,
    Colors.amber,
    Colors.cyan,
    Colors.grey,
    Colors.indigo,
    Colors.orange,
    Colors.purple,
    Colors.yellow
  ];
  late Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withOpacity(0.55),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            widget.todoText!,
          )),
          SizedBox(
            width: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    editTodos(context);
                  },
                  child: Icon(
                    Icons.edit,
                  )),
              SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () {
                    widget.deleteFunction!(widget.todoText);
                  },
                  child: Icon(
                    Icons.delete,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
