import 'package:hive/hive.dart';

part 'pokemon_hive_model.g.dart';

@HiveType(typeId: 0)
class PokemonHiveModel extends HiveObject {
  @HiveField(0)
  String pokemonHiveModel;

  PokemonHiveModel(this.pokemonHiveModel);
}
