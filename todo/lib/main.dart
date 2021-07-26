import 'package:flutter/material.dart';
import 'package:todo/ui/app_router.dart';

void main() {
  runApp(ToDoApp(
    appRouter: AppRouter(),
  ));
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
