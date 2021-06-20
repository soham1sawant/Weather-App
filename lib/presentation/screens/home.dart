import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/weekday.dart';
import '../widgets/bottom_row.dart';
import '../../logic/bloc/current_bloc/current_bloc.dart';
import '../../logic/the_colors.dart';

class Home extends StatelessWidget {
  final _weekDay = WeekDay.getDays();
  final _theColors = TheColors.getColors();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: _theColors.backgroundColor,
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
                                  color: _theColors.textColor,
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
                          color: _theColors.textColor,
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
                          color: _theColors.textColor,
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
                                  color: _theColors.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Icon(
                            Icons.error,
                            color: _theColors.textColor,
                          );
                        }
                      },
                    ),
                  ),
                  BottomRow(
                    color: _theColors.textColor,
                    day: "TOMORROW",
                    num: 1,
                  ),
                  Container(
                    height: 4.0,
                    width: 400.0,
                    color: _theColors.textColor,
                  ),
                  BottomRow(
                    color: _theColors.textColor,
                    day: _weekDay.dayplus2,
                    num: 2,
                  ),
                  Container(
                    height: 4.0,
                    width: 400.0,
                    color: _theColors.textColor,
                  ),
                  BottomRow(
                    color: _theColors.textColor,
                    day: _weekDay.dayplus3,
                    num: 3,
                  ),
                  Container(
                    height: 4.0,
                    width: 400.0,
                    color: _theColors.textColor,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
