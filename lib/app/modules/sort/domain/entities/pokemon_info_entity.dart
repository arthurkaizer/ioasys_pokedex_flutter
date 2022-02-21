class PokemonInfoEntity {
  final String id;
  final String name;
  final String imageUrl;
  final String type;
  final double height;
  final double weight;
  final String moves1;
  final String moves2;
  final int hp;
  final int atk;
  final int def;
  final int satk;
  final int sdef;
  final int spd;

  PokemonInfoEntity({
    required this.type,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.moves1,
    required this.moves2,
    required this.hp,
    required this.atk,
    required this.def,
    required this.satk,
    required this.sdef,
    required this.spd,
  });
}
