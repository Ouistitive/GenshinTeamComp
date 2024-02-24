
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entity/Character.dart';

class FetchCharacters {

  final _url = 'https://genshin.jmp.blue/characters/all';
  bool _travelerAlreadyAdded = false;

  Future<List<Character>> fetchAllCharacters() async {
    List<Character> characters = [];

    http.Response res = await http.get(Uri.parse(_url));
    if (res.statusCode != 200) {
      throw Exception("Can't get characters.");
    }

    final body = json.decode(res.body);
    for(var i = 0; i < body.length; i++) {
      if(body[i]['name'] == "Traveler") {
        if(_travelerAlreadyAdded) {
          continue;
        }
        _travelerAlreadyAdded = true;
      }

      characters.add(Character.fromJson(body[i]));
    }

    return characters;
  }

}