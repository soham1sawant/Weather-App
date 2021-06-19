import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/bloc/current_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                        if (state is CurrentWeatherInProgress) {
                          return CircularProgressIndicator();
                        } else if (state is CurrentWeatherLoadSuccess) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'lib/assets/icons/${state.weather.weatherIcon}.png'),
                              Text(
                                state.weather.temperature.toString().substring(0, state.weather.temperature.toString().indexOf(' ')) + ' °C', // TODO: get icon for Celcius
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "17", // TODO: get current temp. based on 'TomorrowCubit'
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          SizedBox(
                              height: 30.0,
                              width: 40.0,
                              child: Image.asset(
                                  'lib/assets/icons/01d.png')), // TODO: get weather icon based on 'TomorrowCubit'
                        ],
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
                        "Sunday", // TODO: get weekday name based on 'WeekdayCubit'
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "17", // TODO: get current temp. based on 'TomorrowPlusOneCubit'
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          SizedBox(
                              height: 30.0,
                              width: 40.0,
                              child: Image.asset(
                                  'lib/assets/icons/01d.png')), // TODO: get weather icon based on 'TomorrowPlusOneCubit'
                        ],
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
                        "Monday", // TODO: get weekday name based on 'WeekdayCubit'
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "24", // TODO: get current temp. based on 'TomorrowPlusTwoCubit'
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          SizedBox(
                            height: 30.0,
                            width: 40.0,
                            child: Image.asset(
                                'lib/assets/icons/01d.png'), // TODO: get weather icon based on 'TomorrowPlusTwoCubit'
                          ),
                        ],
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
