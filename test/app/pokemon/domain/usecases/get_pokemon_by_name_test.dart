import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon_guarani/app/cores/error/failures.dart';
import 'package:pokemon_guarani/app/data/models/ability_model.dart';
import 'package:pokemon_guarani/app/data/models/pokemon_model.dart';
import 'package:pokemon_guarani/app/data/models/stat_model.dart';
import 'package:pokemon_guarani/app/data/models/type_model.dart';
import 'package:pokemon_guarani/app/domain/entities/pokemon.dart';
import 'package:pokemon_guarani/app/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_guarani/app/domain/usecases/get_pokemon_by_name.dart';

class MockGetPokemonByName extends Mock implements PokemonRepository {}

void main() {
  MockGetPokemonByName repository = MockGetPokemonByName();
  GetPokemonByNameUsecase usecase = GetPokemonByNameUsecase(repository);
  String tName = 'pikachu';
  PokemonModel tPokemonModel = PokemonModel(
    name: 'Pikachu',
    baseExperience: 20,
    height: 100,
    isDefault: false,
    weight: 100,
    abilities: [AbilityModel(name: 'voar')],
    stats: [StatModel(baseStat: 100, effort: 100, name: 'name', url: 'url')],
    types: [TypeModel(name: 'aa', url: 'url')],
  );

  Pokemon tPokemon = tPokemonModel;
  NotFoundFailure tfailure = NotFoundFailure();

  test('should return a pokemon by his name from the repository', () async {
    when(() => repository.getPokemonByName(tName)).thenAnswer(
      (_) async => Right(tPokemonModel),
    );
    final result = await usecase.getPokemonByName(tName);

    expect(result, Right(tPokemon));
    verify(() => repository.getPokemonByName(tName));
    verifyNoMoreInteractions(repository);
  });

  test('should return a failure', () async {
    when(() => repository.getPokemonByName(tName)).thenAnswer(
      (_) async => Left(tfailure),
    );
    final result = await usecase.getPokemonByName(tName);

    expect(result, Left(tfailure));
    verify(() => repository.getPokemonByName(tName));
    verifyNoMoreInteractions(repository);
  });
}
