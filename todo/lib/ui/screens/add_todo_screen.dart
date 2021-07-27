import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/addtodo_cubit.dart';

class AddToDoScreen extends StatelessWidget {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add ToDo"),
      ),
      body: BlocListener<AddToDoCubit, AddToDoState>(
        listener: (context, state) {
          if (state is ToDoAdded) {
            Navigator.of(context).pop();
          } else if (state is AddToDoError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                controller: _controller,
                decoration:
                    InputDecoration(hintText: "Enter your todo message"),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: BlocBuilder<AddToDoCubit, AddToDoState>(
                      builder: (context, state) {
                        if (state is AddToDoLoading) {
                          return CircularProgressIndicator();
                        }
                        return Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
                onTap: () {
                  final message = _controller.text;
                  BlocProvider.of<AddToDoCubit>(context).addToDo(message);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
