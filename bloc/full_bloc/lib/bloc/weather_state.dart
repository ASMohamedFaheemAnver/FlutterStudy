part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherStartingState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weather;
  WeatherLoadedState({this.weather});
}

class WeatherErrorState extends WeatherState {
  final String error;
  WeatherErrorState({this.error});
}
