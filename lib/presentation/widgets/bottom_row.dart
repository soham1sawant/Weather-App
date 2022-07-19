import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bloc/next_days_bloc/next_days_bloc.dart';

class BottomRow extends StatelessWidget {
  final day;
  final color;
  final num;

  const BottomRow({Key? key, this.day, this.color, this.num}) : super(key: key);

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
        BlocBuilder<NextDaysBloc, NextDaysState>(
          builder: (context, state) {
            if (state is NextDaysLoadSuccess) {
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
                        'lib/assets/icons/${state.weather.daily[num].weatherV[0].icon}.png'),
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
