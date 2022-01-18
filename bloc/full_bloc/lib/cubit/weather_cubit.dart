import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_state.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit({this.weatherRepository}) : super(WeatherStartingState());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoadingState());
      final weather = await weatherRepository.fetchWeather(cityName);
      emit(WeatherLoadedState(weather: weather));
    } catch (e) {
      emit(WeatherErrorState(error: e.toString()));
    }
  }
}
