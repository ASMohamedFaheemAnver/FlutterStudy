import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({this.weatherRepository}) : super(WeatherStartingState()) {
    on<WeatherEvent>((event, emit) async {
      switch (event.runtimeType) {
        case GetWeatherEvent:
          try {
            emit(WeatherLoadingState());
            final weather = await weatherRepository
                .fetchWeather((event as GetWeatherEvent).cityName);
            emit(WeatherLoadedState(weather: weather));
          } catch (e) {
            emit(WeatherErrorState(error: e.toString()));
          }
      }
    });
  }
}
