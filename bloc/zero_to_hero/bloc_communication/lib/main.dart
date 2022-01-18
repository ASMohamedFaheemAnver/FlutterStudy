import 'package:bloc_access/logic/cubit/counter_cubit.dart';
import 'package:bloc_access/logic/cubit/internet_cubit.dart';
import 'package:bloc_access/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  final Connectivity connectivity = Connectivity();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(
          create: (context) => CounterCubit(
              internetCubit: BlocProvider.of<InternetCubit>(context)),
        )
      ],
      child: MaterialApp(
        title: 'Cubit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
