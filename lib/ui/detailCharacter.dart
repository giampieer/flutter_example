import 'package:app_prueba/model/character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class detailCharacter extends StatefulWidget {
  Character character;

  detailCharacter({Key key, this.character}) : super(key: key);

  detailCharacterState createState() => detailCharacterState();
}

class detailCharacterState extends State<detailCharacter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size / 10;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(widget.character.name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                    ],
                  )),
              Container(
                height: size.width * 9.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.network(widget.character.image),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text('STATUS: ' + widget.character.status)),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text('SPECIES: ' + widget.character.species)),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(child: Text('TYPE: ' + widget.character.type)),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text('GENDER: ' + widget.character.gender)),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                          child:
                              Text('ORIGIN: ' + widget.character.origin.name)),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                              'LOCATION: ' + widget.character.location.name)),
                    ],
                  )),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ));
  }
}
