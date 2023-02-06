import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/current_weather/bloc/current_bloc.dart';
import 'package:weather_app/features/nextday_weather/ui/bottom_row.dart';
import 'package:weather_app/features/weekday/cubit/weekday_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).focusColor,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<CurrentBloc, CurrentState>(
                        builder: (context, state) {
                          if (state is CurrentLoadInProgress) {
                            return const CircularProgressIndicator();
                          } else if (state is CurrentLoadSuccess) {
                            return Expanded(
                              child: Text(
                                state.weather.areaName!,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 50.0,
                                ),
                              ),
                            );
                          } else if (state is CurrentLoadFailure) {
                            return const Icon(Icons.error);
                          } else {
                            return const Icon(Icons.error);
                          }
                        },
                      ),
                      Icon(
                        Icons.search,
                        color: Theme.of(context).hintColor,
                        size: 50.0,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'TODAY',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Expanded(
                  flex: 5,
                  child: BlocBuilder<CurrentBloc, CurrentState>(
                    builder: (context, state) {
                      if (state is CurrentLoadSuccess) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/${state.weather.weatherIcon}.png',
                            ),
                            Text(
                              '${state.weather.temperature.toString().substring(0, state.weather.temperature.toString().indexOf(' '))} °C',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Icon(
                          Icons.error,
                          color: Theme.of(context).hintColor,
                        );
                      }
                    },
                  ),
                ),
                BottomRow(
                  color: Theme.of(context).hintColor,
                  day: "TOMORROW",
                  num: 1,
                ),
                Container(
                  height: 4.0,
                  width: 400.0,
                  color: Theme.of(context).hintColor,
                ),
                BlocBuilder<WeekdayCubit, WeekdayState>(
                  builder: (context, state) {
                    if (state is WeekdayLoaded) {
                      return BottomRow(
                        color: Theme.of(context).hintColor,
                        day: state.plus2Day,
                        num: 2,
                      );
                    } else {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    }
                  },
                ),
                Container(
                  height: 4.0,
                  width: 400.0,
                  color: Theme.of(context).hintColor,
                ),
                BlocBuilder<WeekdayCubit, WeekdayState>(
                  builder: (context, state) {
                    if (state is WeekdayLoaded) {
                      return BottomRow(
                        color: Theme.of(context).hintColor,
                        day: state.plus3Day,
                        num: 3,
                      );
                    } else {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    }
                  },
                ),
                Container(
                  height: 4.0,
                  width: 400.0,
                  color: Theme.of(context).hintColor,
                ),
              ],
            ),
          )),
    );
  }
}
