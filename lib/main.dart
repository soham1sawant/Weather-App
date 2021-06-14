import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/bloc/current_bloc.dart';
import 'package:weather_app/presentation/screens/home.dart';
void main() {
  runApp(App());
}

class App extends StatelessWidget {

  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentBloc()..add(CurrentFetched()),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
