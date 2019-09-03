import 'package:flutter/material.dart';
import 'package:my_onepick_pokemon/screens/setting_screen.dart';

class TermRadioButton extends StatefulWidget {
  @override
  _TermRadioButtonState createState() => _TermRadioButtonState();
}

class _TermRadioButtonState extends State<TermRadioButton> {
  int term;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text('8강'),
                  leading: Radio(
                    value: 8,
                    groupValue: term,
                    onChanged: (value) {
                      setState(() {
                        this.term = value;
                        SettingScreen.term = this.term;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text('16강'),
                  leading: Radio(
                    value: 16,
                    groupValue: term,
                    onChanged: (value) {
                      setState(() {
                        this.term = value;
                        SettingScreen.term = this.term;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text('32강'),
                  leading: Radio(
                    value: 32,
                    groupValue: term,
                    onChanged: (value) {
                      setState(() {
                        this.term = value;
                        SettingScreen.term = this.term;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text('64강'),
                  leading: Radio(
                    value: 64,
                    groupValue: term,
                    onChanged: (value) {
                      setState(() {
                        this.term = value;
                        SettingScreen.term = this.term;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text('128강'),
                  leading: Radio(
                    value: 128,
                    groupValue: term,
                    onChanged: (value) {
                      setState(() {
                        this.term = value;
                        SettingScreen.term = this.term;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text('256강'),
                  leading: Radio(
                    value: 256,
                    groupValue: term,
                    onChanged: (value) {
                      setState(() {
                        this.term = value;
                        SettingScreen.term = this.term;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
