import 'dart:convert';
import 'package:weatherapp/data/data_provider/weather_data_provider.dart';
import 'package:weatherapp/models/weather_models.dart';

class WeatherRepository {

  //We call the WeatherDataProvider to get the weather data. and insert it here 
  //in our repositoryr as our storage of data.
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final weatherData = await WeatherDataProvider().getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromJson(weatherData);
    } catch (e) {
      throw e.toString();
    }
  }
}
