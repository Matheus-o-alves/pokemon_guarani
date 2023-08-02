import 'package:hive/hive.dart';

import '../../models/hive/pokemon_hive_model.dart';

abstract class PokemonHivRepository {
  Future<List<PokemonHiveModel>> getAllStrings();
  Future<void> addString(String string);
  Future<void> deleteString(int index);
}

class HivePokemonRepository implements PokemonHivRepository {
  final Box<PokemonHiveModel> _pokemonBox;

  HivePokemonRepository(this._pokemonBox);

  @override
  Future<List<PokemonHiveModel>> getAllStrings() async {
    return _pokemonBox.values.toList();
  }

  @override
  Future<void> addString(String string) async {
    await _pokemonBox.add(PokemonHiveModel(string));
  }

  @override
  Future<void> deleteString(int index) async {
    await _pokemonBox.deleteAt(index);
  }
}
