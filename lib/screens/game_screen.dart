import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'package:my_onepick_pokemon/pokemonInfo.dart' as pokemonInfo;

const String imageURL =
    'https://assets.pokemon.com/assets/cms2/img/pokedex/full/';

class GameScreen extends StatefulWidget {
  static const String id = 'game_screen';
  GameScreen(this.term);
  final int term;
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List candidatePokemonList = [];
  List winnerPokemonList = [];
  int firstPokemonNo, secondPokemonNo;
  int count = 2;
  int term = 0;

  @override
  void initState() {
    super.initState();
    List totalPokemonList = List.generate(808, (int index) => index + 1);
    totalPokemonList.shuffle();

    candidatePokemonList = totalPokemonList.sublist(0, widget.term);

    firstPokemonNo = popPokemonNo();
    secondPokemonNo = popPokemonNo();
    term = widget.term;
  }

  int popPokemonNo() {
    int num = candidatePokemonList[0];
    candidatePokemonList.removeAt(0);
    return num;
  }

  String stringPokemonNo(int num) {
    if (num < 10) {
      return '00$num';
    } else if (num < 100) {
      return '0$num';
    } else {
      return '$num';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text('$count/$term'),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                        '($firstPokemonNo) ${pokemonInfo.pokemonName[firstPokemonNo - 1]}'),
                    Expanded(
                      child: FlatButton(
                        child: Image.network(
                            '$imageURL${stringPokemonNo(firstPokemonNo)}.png'),
                        onPressed: () {
                          if (winnerPokemonList.length < term / 2) {
                            winnerPokemonList.add(firstPokemonNo);
                          }
                          setState(() {
                            if (candidatePokemonList.length > 0) {
                              firstPokemonNo = popPokemonNo();
                              secondPokemonNo = popPokemonNo();
                              count = count + 2;
                            } else {
                              if (term != 2) {
                                candidatePokemonList = winnerPokemonList;
                                winnerPokemonList = [];
                                candidatePokemonList.shuffle();
                                count = 2;
                                term = term ~/ 2;

                                _showDialog('$term강을 시작합니다');
                                firstPokemonNo = popPokemonNo();
                                secondPokemonNo = popPokemonNo();
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultScreen(
                                            winnerNumber: firstPokemonNo)));
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                        '($secondPokemonNo) ${pokemonInfo.pokemonName[secondPokemonNo - 1]}'),
                    Expanded(
                      child: FlatButton(
                        child: Image.network(
                            '$imageURL${stringPokemonNo(secondPokemonNo)}.png'),
                        onPressed: () {
                          if (winnerPokemonList.length < term / 2) {
                            winnerPokemonList.add(secondPokemonNo);
                          }
                          setState(() {
                            if (candidatePokemonList.length > 0) {
                              firstPokemonNo = popPokemonNo();
                              secondPokemonNo = popPokemonNo();
                              count = count + 2;
                            } else {
                              if (term != 2) {
                                candidatePokemonList = winnerPokemonList;
                                winnerPokemonList = [];
                                candidatePokemonList.shuffle();
                                count = 2;
                                term = term ~/ 2;

                                _showDialog('$term강을 시작합니다');
                                firstPokemonNo = popPokemonNo();
                                secondPokemonNo = popPokemonNo();
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultScreen(
                                            winnerNumber: secondPokemonNo)));
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(String text) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Text(
            text,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text(
                "선택하기",
                style: TextStyle(color: Colors.deepOrange),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
