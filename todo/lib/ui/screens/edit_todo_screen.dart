import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/edittodo_cubit.dart';
import 'package:todo/data/models/todo.dart';

class EditToDoScreen extends StatelessWidget {
  final ToDo toDo;
  EditToDoScreen({Key? key, required this.toDo}) : super(key: key);
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = this.toDo.todoMessage;
    return BlocListener<EditToDoCubit, EditToDoState>(
      listener: (context, state) {
        if (state is ToDoEdited) {
          Navigator.of(context).pop();
        } else if (state is EditToDoError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("EditTodo"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: BlocBuilder<EditToDoCubit, EditToDoState>(
                builder: (context, state) {
                  if (state is DeleteToDoLoading) {
                    return CircularProgressIndicator(
                      color: Colors.black,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        BlocProvider.of<EditToDoCubit>(context)
                            .deleteToDo(toDo);
                      },
                      child: Icon(Icons.delete));
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                autocorrect: true,
                decoration: InputDecoration(hintText: "Edit your todo message"),
              ),
              SizedBox(height: 10.0),
              InkWell(
                  onTap: () {
                    BlocProvider.of<EditToDoCubit>(context)
                        .updateToDo(_controller.text, toDo);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: BlocBuilder<EditToDoCubit, EditToDoState>(
                        builder: (context, state) {
                          if (state is EditToDoLoading) {
                            return CircularProgressIndicator();
                          }
                          return Text(
                            "Update",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
