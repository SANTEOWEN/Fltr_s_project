//all of the data logics will always go on data_provider folders and this file is one of them
import 'package:http/http.dart' as http;
import 'package:weatherapp/secrets.dart';

class WeatherDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try { 
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

    return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
