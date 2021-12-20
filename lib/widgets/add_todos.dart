import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_list.dart';

class AddTodos extends StatefulWidget {
  final int? index;
  final String? textTodos;
  const AddTodos({Key? key, this.textTodos, this.index}) : super(key: key);

  @override
  _AddTodosState createState() => _AddTodosState();
}

class _AddTodosState extends State<AddTodos> {
  TextEditingController? _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.textTodos);
  }

  @override
  void dispose() {
    super.dispose();
    _textController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoListProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        color: Colors.grey.withOpacity(0.4),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your todos here',
                ),
              ),
              TextButton(
                  onPressed: () {
                    try {
                      widget.index == null
                          ? todoData.addTodo(_textController!.text)
                          : todoData.editTodo(
                              widget.index, _textController!.text);
                    } catch (e) {
                      print(e);
                    } finally {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add')),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
