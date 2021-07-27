import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constants/strings.dart';
import 'package:todo/cubits/todo_cubit.dart';
import 'package:todo/data/models/todo.dart';

class ToDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ToDoCubit>(context).fetchToDo();
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              child: Icon(Icons.add),
              onTap: () {
                Navigator.of(context).pushNamed(ADD_TODO_ROUTE);
              },
            ),
          )
        ],
      ),
      body: BlocBuilder<ToDoCubit, ToDoState>(
        builder: (context, state) {
          if (!(state is ToDoLoaded)) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final toDoList = state.toDoList;

          return SingleChildScrollView(
            child: Column(
              children: toDoList.map((e) => toDo(e, context)).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget toDo(ToDo toDo, BuildContext context) {
    return InkWell(
      child: Dismissible(
        key: Key(toDo.id.toString()),
        background: Container(
          color: Colors.indigo,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.green))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(toDo.todoMessage), completionIndicator(toDo)],
          ),
        ),
        confirmDismiss: (_) async {
          BlocProvider.of<ToDoCubit>(context).changeCompletion(toDo);
          return false;
        },
      ),
      onTap: () =>
          Navigator.of(context).pushNamed(EDIT_TODO_ROUTE, arguments: toDo),
    );
  }

  Widget completionIndicator(ToDo toDo) {
    return !toDo.isLoading
        ? Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    width: 4,
                    color: toDo.isCompleted ? Colors.green : Colors.red)),
          )
        : Container(width: 20, height: 20, child: CircularProgressIndicator());
  }
}
