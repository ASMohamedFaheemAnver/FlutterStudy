import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/constants/strings.dart';
import 'package:todo/cubits/addtodo_cubit.dart';
import 'package:todo/cubits/edittodo_cubit.dart';
import 'package:todo/cubits/todo_cubit.dart';
import 'package:todo/data/models/todo.dart';
import 'package:todo/data/services/todo_service.dart';
import 'package:todo/data/todo_repository.dart';
import 'package:todo/ui/screens/add_todo_screen.dart';
import 'package:todo/ui/screens/edit_todo_screen.dart';
import 'package:todo/ui/screens/page_not_found_screen.dart';
import 'package:todo/ui/screens/todo_screen.dart';

class AppRouter {
  late ToDoRepository toDoRepository;
  late ToDoCubit toDoCubit;
  AppRouter() {
    toDoRepository = ToDoRepository(toDoService: ToDoService());
    toDoCubit = ToDoCubit(toDoRepository: toDoRepository);
  }
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TODO_ROUTE:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: toDoCubit,
                  child: ToDoScreen(),
                ));
      case EDIT_TODO_ROUTE:
        final toDo = settings.arguments as ToDo;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => EditToDoCubit(
                      toDoRepository: toDoRepository, toDoCubit: toDoCubit),
                  child: EditToDoScreen(toDo: toDo),
                ));
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AddToDoCubit(
                      toDoRepository: toDoRepository, toDoCubit: toDoCubit),
                  child: AddToDoScreen(),
                ));
      default:
        return MaterialPageRoute(builder: (context) => PageNotFoundScreen());
    }
  }
}
