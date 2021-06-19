import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/bloc/current_bloc/current_bloc.dart';
import 'package:weather_app/logic/bloc/next_days_bloc/next_days_bloc.dart';
import 'package:weather_app/logic/weekday.dart';

class Home extends StatelessWidget {
  WeekDay _weekDay = WeekDay.getDays();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors
              .yellow, // TODO: to change background color based on 'BackgroundCubit'
          body: Padding(
            padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 60.0),
            child: Container(
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
                            if (state is CurrentWeatherInProgress) {
                              return CircularProgressIndicator();
                            } else if (state is CurrentWeatherLoadSuccess) {
                              return Text(
                                state.weather.areaName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50.0,
                                ),
                              );
                            } else {
                              return Icon(Icons.error);
                            }
                          },
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.black,
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 5,
                    child: BlocBuilder<CurrentBloc, CurrentState>(
                      builder: (context, state) {
                        if (state is CurrentWeatherLoadSuccess) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'lib/assets/icons/${state.weather.weatherIcon}.png'),
                              Text(
                                state.weather.temperature.toString().substring(
                                        0,
                                        state.weather.temperature
                                            .toString()
                                            .indexOf(' ')) +
                                    ' °C',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Icon(Icons.error);
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOMORROW',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      BlocBuilder<NextDaysBloc, NextDaysState>(
                        builder: (context, state) {
                          if (state is NextDaysLoadSuccess) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.weather.daily[1].temp.day
                                          .toStringAsFixed(1) +
                                      ' °C',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                SizedBox(
                                    height: 30.0,
                                    width: 40.0,
                                    child: Image.asset(
                                        'lib/assets/icons/${state.weather.daily[1].weatherV[0].icon}.png')),
                              ],
                            );
                          } else {
                            return Icon(Icons.error);
                          }
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: 4.0,
                    width: 400.0,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _weekDay.dayplus2, // TODO: get weekday name
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      BlocBuilder<NextDaysBloc, NextDaysState>(
                        builder: (context, state) {
                          if (state is NextDaysLoadSuccess) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.weather.daily[2].temp.day
                                          .toStringAsFixed(1) +
                                      ' °C',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                SizedBox(
                                    height: 30.0,
                                    width: 40.0,
                                    child: Image.asset(
                                        'lib/assets/icons/${state.weather.daily[2].weatherV[0].icon}.png')),
                              ],
                            );
                          } else {
                            return Icon(Icons.error);
                          }
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: 4.0,
                    width: 400.0,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _weekDay.dayplus3, // TODO: get weekday name
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      BlocBuilder<NextDaysBloc, NextDaysState>(
                        builder: (context, state) {
                          if (state is NextDaysLoadSuccess) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    state.weather.daily[3].temp.day
                                            .toStringAsFixed(1) +
                                        ' °C',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0)),
                                SizedBox(
                                    height: 30.0,
                                    width: 40.0,
                                    child: Image.asset(
                                        'lib/assets/icons/${state.weather.daily[3].weatherV[0].icon}.png')),
                              ],
                            );
                          } else {
                            return Icon(Icons.error);
                          }
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: 4.0,
                    width: 400.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
