import 'package:flutter/material.dart';
import 'package:my_onepick_pokemon/screens/start_screen.dart';
import 'package:my_onepick_pokemon/screens/setting_screen.dart';

void main() => runApp(MyOnePickPokemon());

class MyOnePickPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id: (context) => StartScreen(),
        SettingScreen.id: (context) => SettingScreen(),
      },
    );
  }
}
