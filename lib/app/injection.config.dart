import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

import 'features/pokemon/data/models/hive/pokemon_hive_model.dart';
import 'features/pokemon/data/repositories/hive_repository/pokemon_hive_repository.dart';

@InjectableInit()
void configureInjection() {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<Box<PokemonHiveModel>>(
      () => Hive.box<PokemonHiveModel>('string_list'));

  getIt.registerLazySingleton<PokemonHivRepository>(
      () => HivePokemonRepository(getIt<Box<PokemonHiveModel>>()));
}
