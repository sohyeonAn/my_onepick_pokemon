import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'package:my_onepick_pokemon/widgets/term_radio_button.dart';

enum terms { termOf8, termOf16, termOf32, termOf64, termOf128 }
const String imageURL =
    'https://assets.pokemon.com/assets/cms2/img/pokedex/full/';

class SettingScreen extends StatefulWidget {
  static const String id = 'setting_screen';
  static int term;

  @override
  _State createState() => _State();
}

class _State extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('시작하기 전에'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '총 808개의 포켓몬이 있습니다.',
                style: TextStyle(fontSize: 30.0),
              ),
              Text('몇 개의 포켓몬으로 게임을 하시겠습니까?'),
              TermRadioButton(),
              FlatButton(
                child: Text("시작하기"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(SettingScreen.term),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
