
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genshin_teamcomp/model/entity/Character.dart';

import '../model/api/FetchCharacters.dart';
import '../view/componant/CharacterCard.dart';

class AddTeamCompController {
  FetchCharacters fetchCharacters = FetchCharacters();

  static const String title = 'Add a new Team composition';

  Future<Widget> getCharacterCards() async {
    List<CharacterCard> characterCards = [];

    List<Character> characters = await fetchCharacters.fetchAllCharacters();
    for(var i = 0; i < characters.length; i++) {
      characterCards.add(CharacterCard(
        name: characters[i].name,
        rarity: characters[i].rarity,
        element: characters[i].element,
        weapon: characters[i].weapon,
      ));
    }

    return Expanded(
      child: ListView.builder(
        itemCount: (characterCards.length / 3).ceil(),
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: characterCards
                .skip(index * 3)
                .take(3)
                .map((characterCard) => Expanded(
              child: characterCard,
            ))
                .toList(),
          );
        },
      ),
    );

  }
}