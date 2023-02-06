import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weather_app/features/current_weather/bloc/current_bloc.dart';
import 'package:weather_app/features/current_weather/ui/home_page.dart';
import 'package:weather_app/features/nextday_weather/bloc/nextdays_bloc.dart';
import 'package:weather_app/features/weekday/cubit/weekday_cubit.dart';
import 'package:weather_app/styles/themes.dart';
import 'package:weekdays/weekdays.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherApiClient>(
          create: (context) => WeatherApiClient(),
        ),
        RepositoryProvider<WeekdaysClient>(
          create: (context) => WeekdaysClient(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CurrentBloc(
              RepositoryProvider.of<WeatherApiClient>(context),
            )..add(const CurrentWeatherRequested()),
          ),
          BlocProvider(
            create: (context) => NextdaysBloc(
              client: RepositoryProvider.of<WeatherApiClient>(context),
            )..add(NextDayWeatherRequested()),
          ),
          BlocProvider(
            create: (context) => WeekdayCubit(
              client: RepositoryProvider.of<WeekdaysClient>(context),
            )..getPlusDay(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
           home: const HomePage(),
        ),
      ),
    );
  }
}
