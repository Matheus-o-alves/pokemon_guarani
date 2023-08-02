import '../../domain/entities/pokemon_thumbnail.dart';

class PokemonThumbnailModel extends PokemonThumbnail {
  // static int idPokemon = 0;
  PokemonThumbnailModel({
    required int id,
    required String name,
    required String url,
  }) : super(id: id, name: name, url: url);

  factory PokemonThumbnailModel.fromJson(Map json) {
    return PokemonThumbnailModel(
      id: int.parse(json['url'].split('/')[6]),
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
