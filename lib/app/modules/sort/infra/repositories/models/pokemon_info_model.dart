import '../../../domain/entities/pokemon_info_entity.dart';

class PokemonInfoModel extends PokemonInfoEntity {
  PokemonInfoModel({
    required String type,
    required String id,
    required String name,
    required String imageUrl,
    required double height,
    required double weight,
    required String moves1,
    required String moves2,
    required int hp,
    required int atk,
    required int def,
    required int satk,
    required int sdef,
    required int spd,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          type: type,
          height: height,
          weight: weight,
          moves1: moves1,
          moves2: moves2,
          hp: hp,
          atk: atk,
          def: def,
          satk: satk,
          sdef: sdef,
          spd: spd,
        );

  factory PokemonInfoModel.fromJson(Map<String, dynamic> json) {
    return PokemonInfoModel(
      id: json['id'].toString(),
      name: json['name'],
      imageUrl: json['sprites']['other']['dream_world']['front_default'],
      type: json['types'][0]['type']['name'],
      height: double.parse(json['height'].toString()),
      weight: double.parse(json['weight'].toString()),
      moves1: json['abilities'][0]['ability']['name'],
      moves2: json['abilities'][1]['ability']['name'],
      hp: json['stats'][0]['base_stat'],
      atk: json['stats'][1]['base_stat'],
      def: json['stats'][2]['base_stat'],
      satk: json['stats'][3]['base_stat'],
      sdef: json['stats'][4]['base_stat'],
      spd: json['stats'][5]['base_stat'],
    );
  }
}
