
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genshin_teamcomp/model/entity/Character.dart';

import '../model/api/FetchCharacters.dart';
import '../view/componant/CharacterCard.dart';

class AddTeamCompController {
  FetchCharacters fetchCharacters = FetchCharacters();
  List<Character> characters = [];
  List<CharacterCard> characterCards = [];

  static const String title = 'Add a new Team composition';

  Future<void> initializeData() async {
    try {
      characters = await fetchCharacters.fetchAllCharacters();

      characterCards = characters.map((character) => CharacterCard(
        name: character.name,
        rarity: character.rarity,
        element: character.element,
        weapon: character.weapon,
      )).toList();
    } catch (e) {
      print('Error initializing data: $e');
    }
  }

  Future<List<CharacterCard>> getCharacterCards() async {
    List<Character> characters = await fetchCharacters.fetchAllCharacters();
    List<CharacterCard> characterCards = characters.map((character) => CharacterCard(
      name: character.name,
      rarity: character.rarity,
      element: character.element,
      weapon: character.weapon,
    )).toList();

    return characterCards;
  }


  Future<List<CharacterCard>> searchCharacter(String? name) async {
    characterCards = [];

    for(var i = 0; i < characters.length; i++) {
      if(name == null) {
        characterCards.add(CharacterCard(
          name: characters[i].name,
          rarity: characters[i].rarity,
          element: characters[i].element,
          weapon: characters[i].weapon,
        ));
        continue;
      }

      if(characters[i].name.toLowerCase().contains(name.toLowerCase())) {
        characterCards.add(CharacterCard(
          name: characters[i].name,
          rarity: characters[i].rarity,
          element: characters[i].element,
          weapon: characters[i].weapon,
        ));
      }

    }

    return characterCards;
  }

}