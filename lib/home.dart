import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Color textColor;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    textColor = (data['dayOrNight'] == 'morn') ? Colors.black : Colors.white ;

    return SafeArea(
      child: Scaffold(
          backgroundColor: (data['dayOrNight'] == 'morn') ? Colors.yellow : Colors.blue[900],
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
                        Text(
                          data['location'],
                          style: TextStyle(
                            color: textColor,
                            fontSize: 50.0,
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: textColor,
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
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('lib/assets/icons/${data['mainIcon']}.png'),
                        Text(
                          data['tempToday'],
                          style: TextStyle(
                            fontSize: 25.0,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOMORROW',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data['dayPlusOneTemp'],
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          SizedBox(
                              height: 30.0,
                              width: 40.0,
                              child: Image.asset(
                                  'lib/assets/icons/${data['dayPlusOneIcon']}.png')),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 4.0,
                    width: 400.0,
                    color: textColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data['dayPlusTwo'],
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data['dayPlusTwoTemp'],
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          SizedBox(
                              height: 30.0,
                              width: 40.0,
                              child: Image.asset(
                                  'lib/assets/icons/${data['dayPlusTwoIcon']}.png')),
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
                        data['dayPlusThree'],
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data['dayPlusThreeTemp'],
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          SizedBox(
                              height: 30.0,
                              width: 40.0,
                              child: Image.asset(
                                  'lib/assets/icons/${data['dayPlusThreeIcon']}.png')),
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
