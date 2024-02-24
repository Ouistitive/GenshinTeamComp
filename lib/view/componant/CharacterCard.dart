
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  static const cardSize = 130.0;
  static const cardImageSize = 80.0;

  final String name;
  final int rarity;
  final String element;
  final String weapon;

  const CharacterCard({super.key, required this.name, required this.rarity, required this.element, required this.weapon});

  @override
  Widget build(BuildContext context) {
    String nameFormatted = name.toLowerCase().replaceAll(" ", "-");
    if(nameFormatted == "traveler") {
      nameFormatted = "traveler-anemo";
    }

    return SizedBox(
      width: cardSize,
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              width: cardImageSize,
              height: cardImageSize,
              child: Image.network(
                "https://genshin.jmp.blue/characters/$nameFormatted/icon-big${nameFormatted == "traveler-anemo" ? "-lumine" : ""}",
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Image.network(
                    "https://genshin.jmp.blue/characters/${nameFormatted.split("-")[0]}/icon-big",
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Image.network(
                        "https://genshin.jmp.blue/characters/${nameFormatted.split("-")[1]}/icon-big",
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return const Icon(Icons.error);
                        }
                      );
                    }
                  );
                },
              ),
            ),
            Container(
                width: cardImageSize,
                height: cardImageSize,
              child: Image.network("https://genshin.jmp.blue/elements/${element.toLowerCase()}/icon")
            ),
            Text(name),
            Text(rarity.toString()),
            Text(weapon)
          ],
        ),
      ),
    );
  }
}