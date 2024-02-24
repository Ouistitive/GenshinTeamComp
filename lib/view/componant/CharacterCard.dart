
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  static const cardSize = 130.0;
  static const cardImageSize = 80.0;
  static const visionSize = 30.0;

  static Map<String, Color> elementToColor = {
    "Pyro": Colors.red,
    "Hydro": Colors.blue,
    "Anemo": Colors.green,
    "Electro": Colors.purpleAccent,
    "Cryo": Colors.cyan,
    "Geo": Colors.orange,
    "Dendro": Colors.green
  };

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
        shape: RoundedRectangleBorder(
          side: BorderSide(color: elementToColor[element]!, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(rarity, (index) {
                return Image.asset("star.png", width: 20, height: 20);
              },),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: visionSize,
                    height: visionSize,
                  child: Image.network("https://genshin.jmp.blue/elements/${element.toLowerCase()}/icon")
                ),
                Text(name),
              ],
            ),
            Text(weapon),
          ],
        ),
      ),
    );
  }
}