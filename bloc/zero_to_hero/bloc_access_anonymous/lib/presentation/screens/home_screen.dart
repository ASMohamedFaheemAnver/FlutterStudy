import 'package:bloc_access/logic/cubit/counter_cubit.dart';
import 'package:bloc_access/logic/cubit/counter_state.dart';
import 'package:bloc_access/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Incremented")));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Decremented")));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Cubit State Below"),
              BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                return Text("${state.counterValue}");
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      child: Icon(Icons.add)),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).descrement();
                      },
                      child: Icon(Icons.remove)),
                ],
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<CounterCubit>(context),
                            child: SecondScreen(
                                title: "Second Screen",
                                color: Colors.redAccent),
                          )));
                },
                child: Text("Second Screen"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
