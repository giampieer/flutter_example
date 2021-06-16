import 'package:app_prueba/model/character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_prueba/service/services.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  final TextEditingController _filter = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Services objServices = Services();
  List<Character> listCharacters = [];
  int statusSearch = 0;
  String _searchText = "";
  bool _IsSearching;

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    loadCharacters();
  }

  loadCharacters() async {
    listCharacters = await objServices.listCharacter();
    setState(() {});
  }

  SearchState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          statusSearch = 0;
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _filter.text;
          statusSearch = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size / 10;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            key: _scaffoldKey,
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                border: Border.all(color: Colors.black),
                                color: Colors.white),
                            child: Row(children: [
                              Container(width: 20),
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  child: TextField(
                                    autocorrect: false,
                                    controller: _filter,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Buscar por nombres",
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                onPressed: () => null,
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: size.height * 8.4,
                        width: size.width * 10,
                        child: _IsSearching ? _buildSearchList() : Container(),
                      )
                    ],
                  ),
                )
              ],
            ),
            resizeToAvoidBottomPadding: false));
  }

  _buildSearchList() {
    var size = MediaQuery.of(context).size / 10;
    if (_searchText.isEmpty) {
      return listCharacter(size);
    } else {
      return listCharacterSearch(size);
    }
  }

  listCharacter(size) {
    return Container(
        padding: EdgeInsets.only(left: 6, right: 6, bottom: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      itemCount:
                          listCharacters == null ? 0 : listCharacters.length,
                      itemBuilder: (context, index) {
                        String data = listCharacters[index].name;
                        return GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: new BorderSide(width: 1.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.white,
                              child: Container(
                                height: 80,
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        fit: FlexFit.loose,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Flexible(
                                                  fit: FlexFit.loose,
                                                  child: Text(
                                                    data,
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  )),
                                              SizedBox(width: 10),
                                            ]),
                                          ],
                                        )),
                                    Container(
                                        child: Icon(Icons.arrow_forward_ios))
                                  ],
                                ),
                              ),
                            ));
                      })),
            ]));
  }

  listCharacterSearch(size) {
    return Container(
        padding: EdgeInsets.only(left: 6, right: 6, bottom: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text(
                  "Resultados",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount:
                          listCharacters == null ? 0 : listCharacters.length,
                      itemBuilder: (context, index) {
                        String data = listCharacters[index].name;
                        if (statusSearch == 0 &&
                            index + 1 == listCharacters.length) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("No se encontró resultados.",
                                    style: TextStyle(fontSize: 18),
                                    textAlign: TextAlign.center)
                              ],
                            ),
                            height: size.height * 8,
                          );
                        }
                        if (data
                            .toLowerCase()
                            .contains(_searchText.toLowerCase())) {
                          statusSearch = 1;
                          return GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: new BorderSide(width: 1.0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Colors.white,
                                child: Container(
                                  height: 80,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          fit: FlexFit.loose,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                Flexible(
                                                    fit: FlexFit.loose,
                                                    child: Text(
                                                      data,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    )),
                                                SizedBox(width: 10),
                                              ]),
                                            ],
                                          )),
                                      Container(
                                          child: Icon(Icons.arrow_forward_ios))
                                    ],
                                  ),
                                ),
                              ));
                        } else {
                          return Container();
                        }
                      })),
            ]));
  }
}
