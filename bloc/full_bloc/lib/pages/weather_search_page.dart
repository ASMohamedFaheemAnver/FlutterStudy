import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_cubit.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_state.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (cubitContext, state) {
          return Builder(builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: state is WeatherStartingState
                    ? buildInitialInput(state, context)
                    : state is WeatherLoadingState
                        ? buildLoading()
                        : state is WeatherLoadedState
                            ? buildColumnWithData(state.weather)
                            : buildInitialInput(state, context));
          });
        },
      ),
    );
  }

  Widget buildInitialInput(WeatherState state, BuildContext context) {
    if (state is WeatherErrorState) {
      Future.delayed(Duration.zero, () async {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.error)));
      });
    }
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    BlocProvider.of<WeatherCubit>(context).getWeather(cityName);
  }
}
