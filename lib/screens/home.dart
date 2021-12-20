import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_list.dart';
import 'package:todo_app/widgets/add_todos.dart';
import 'package:todo_app/widgets/list_builder_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void addTodos(context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return AddTodos();
        });
  }

  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoListProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
          actions: [
            InkWell(
              onTap: () {
                todoData.deleteAllTodo();
              },
              child: Icon(
                Icons.delete,
                size: 28,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                addTodos(context);
              },
              child: Icon(
                Icons.add,
                size: 28,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTodos(context);
          },
          child: Icon(
            Icons.add,
            size: 32,
          ),
        ),
        body: todoData.todo.length == 0
            ? Center(
                child: Text(
                  'Nothing to show. \nTo add new todos press add button',
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: todoData.todo.length,
                itemBuilder: (ctx, index) {
                  return TodoListWidget(
                    index: index,
                    todoText: todoData.todo[index],
                    deleteFunction: todoData.deleteTodo,
                  );
                }));
  }
}
