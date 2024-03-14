import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/data/data_provider/weather_data_provider.dart';
import 'package:weatherapp/data/repository/weather_repository.dart';
import 'package:weatherapp/presentation/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //If we use multiple repository we can use MultiRepositoryProvider
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        WeatherDataProvider(),
      ),
      child: BlocProvider(
        create: (context) => WeatherBloc(
          //Here we call the weather repository ass our storage for our bloc.
          context.read<WeatherRepository>(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
