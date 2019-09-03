import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:my_onepick_pokemon/pokemonInfo.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:my_onepick_pokemon/screens/setting_screen.dart';

const String imageURL =
    'https://assets.pokemon.com/assets/cms2/img/pokedex/full/';

class ResultScreen extends StatefulWidget {
  static const String id = 'result_screen';
  final int winnerNumber;

  ResultScreen({this.winnerNumber});

  @override
  _State createState() => _State();
}

class _State extends State<ResultScreen> {
  var globalKey = GlobalKey();
  int winnerNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    winnerNumber = widget.winnerNumber;
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
      appBar: AppBar(
        title: Text('과연!'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              return Navigator.popUntil(
                context,
                ModalRoute.withName(SettingScreen.id),
              );
            },
          ),
        ],
        leading: new Container(),
      ),
      body: RepaintBoundary(
        key: globalKey,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '당신이 가장 좋아하는 포켓몬은',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Image.network(
                      '$imageURL${stringPokemonNo(winnerNumber)}.png'),
                  Text(
                    '($winnerNumber) ${pokemonName[winnerNumber - 1]}',
                    style: TextStyle(fontSize: 50.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(15.0),
        child: RaisedButton(
          color: Colors.deepOrange,
          elevation: 5.0,
          highlightElevation: 3.0,
          shape: StadiumBorder(),
          onPressed: () async {
            var image = await _screenshot();
            final ByteData bytes =
                await image.toByteData(format: ui.ImageByteFormat.png);
            await Share.file('share my result to ...', 'result.png',
                bytes.buffer.asUint8List(), 'image/png',
                text: 'here\'s my result!');
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '결과 공유하기',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Icon(
                  Icons.share,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<ui.Image> _screenshot() async {
    ui.Image image;
    print("START CAPTURE");
    var renderObject = globalKey.currentContext.findRenderObject();
    if (renderObject is RenderRepaintBoundary) {
      var boundary = renderObject;
      image = await boundary.toImage();
    }

    return image;
  }
}
