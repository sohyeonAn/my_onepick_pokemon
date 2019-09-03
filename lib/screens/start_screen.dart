import 'package:flutter/material.dart';
import 'package:my_onepick_pokemon/screens/setting_screen.dart';
import 'package:my_onepick_pokemon/screens/game_screen.dart';

class StartScreen extends StatefulWidget {
  static const String id = 'start_screen';
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 45.0),
                children: <TextSpan>[
                  TextSpan(text: '당신의'),
                  TextSpan(
                    text: '최애\n',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: '포켓몬을'),
                  TextSpan(text: '찾아보세요!'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, SettingScreen.id);
            },
            color: Colors.deepOrange,
            child: Text(
              '시작하기',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
//Text(
//'당신의 최애\n포켓몬을 찾아보세요!',
//style: TextStyle(
//fontSize: 55.0,
//),
//textAlign: TextAlign.left,
//),
