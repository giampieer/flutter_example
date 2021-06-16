import 'package:app_prueba/service/connection.dart';
import 'package:app_prueba/model/character.dart';
import 'dart:convert';

class Services {
  Connection objConnection = Connection();

  Future<List> listCharacter() async {
    String url = "/character";
    String res = (await objConnection.apiRequestGet(url));
    if (objConnection.ok == 200) {
      final jsonResponse = json.decode(res);
      CharacterList objTagList =
          CharacterList.fromJsonTag(jsonResponse['results']);
      return objTagList.listTag;
    } else {
      CharacterList objTagList = CharacterList.fromJsonTag([]);
      return objTagList.listTag;
    }
  }
}
