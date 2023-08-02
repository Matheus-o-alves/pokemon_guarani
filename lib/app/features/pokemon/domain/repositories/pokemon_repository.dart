import 'package:dartz/dartz.dart';
import '../../../../cores/error/failures.dart';
import '../../data/models/pokemon_model.dart';
import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemonByName(String name);
  Future<Either<Failure, List<PokemonModel>>> getAllPokemons(
    int paginationStarts,
    int paginationEnds,
  );
  Future<Either<Failure, List<Pokemon>>> getPokemonByNature(
    List<String> pokemonNames,
    int pagination,
  );
  Future<Either<Failure, List<String>>> getPokemonsInThatNature(String nature);
}
