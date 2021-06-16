import 'package:app_prueba/ui/searchCharacter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class validation extends StatefulWidget {
  validationState createState() => validationState();
}

class validationState extends State<validation> {
  final TextEditingController textValidation = TextEditingController();

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
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("Bienvenidos",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("Escribe codigo 24",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                    ],
                  )),
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
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            controller: textValidation,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Escribir codigo",
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                      Container(width: 20),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  elevation: 18.0,
                  color: Colors.blue,
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 35,
                    child: new Text('Validar',
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white)),
                    onPressed: () {
                      if (textValidation.text == "24") {
                        return Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (BuildContext context, _, __) {
                          return Search();
                        }, transitionsBuilder: (_, Animation<double> animation,
                                __, Widget child) {
                          return FadeTransition(
                              opacity: animation, child: child);
                        }));
                      } else {
                        if(textValidation.text ==""){
                          Fluttertoast.showToast(
                              msg: "Campo vacio",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else{
                          Fluttertoast.showToast(
                              msg: "Codigo incorrecto , escribe el codigo 24",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ));
  }
}
