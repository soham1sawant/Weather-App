import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/nextday_weather/bloc/nextdays_bloc.dart';

class BottomRow extends StatelessWidget {
  final String day;
  final Color color;
  final int num;

  const BottomRow({
    Key? key,
    required this.day,
    required this.color,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        BlocBuilder<NextdaysBloc, NextdaysState>(
          builder: (context, state) {
            if (state is NextDaysLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${state.weather.daily[num].temp.day.toStringAsFixed(1)} °C',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                    width: 40.0,
                    child: Image.asset(
                        'assets/${state.weather.daily[num].weatherV[0].icon}.png',),
                  ),
                ],
              );
            } else {
              return Icon(
                Icons.error,
                color: color,
              );
            }
          },
        ),
      ],
    );
  }
}
