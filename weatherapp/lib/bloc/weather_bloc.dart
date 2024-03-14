import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';
import 'package:weatherapp/models/weather_models.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  //We need to pass the weather storage which is the WeatherRepository so we can use all of its data.
  final WeatherRepository weatherRepository;

  //Then we add it on our constructor so we can actually use it.
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {

    //Now we create a function that handles the gathered data from the database
    on<WeatherFetch>(_getCurrentWeather);
  }

  void _getCurrentWeather(
    WeatherFetch event,
    Emitter<WeatherState> emit,

    //We use 
  ) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel : weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
