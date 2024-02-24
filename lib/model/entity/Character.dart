
class Character {
  final String name;
  final int rarity;
  final String element;
  final String weapon;

  Character({required this.name, required this.rarity, required this.element, required this.weapon});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      rarity: json['rarity'],
      element: json['vision'],
      weapon: json['weapon'],
    );
  }
}