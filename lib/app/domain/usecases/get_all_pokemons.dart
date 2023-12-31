import 'package:dartz/dartz.dart';
import '../../cores/error/failures.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetAllPokemonsUsecase {
  final PokemonRepository repository;

  GetAllPokemonsUsecase(this.repository);

  Future<Either<Failure, List<Pokemon>>> getAllPokemons(
    int paginationStarts,
    int paginationEnds,
  ) async {
    return await repository.getAllPokemons(paginationStarts, paginationEnds);
  }
}
