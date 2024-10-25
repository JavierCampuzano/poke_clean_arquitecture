import 'package:dartz/dartz.dart';
import 'package:poke_app/core/error/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';

class SearchPokemonUseCase {
  final PokemonsRepository repository;

  SearchPokemonUseCase({required this.repository});

  Future<Either<Failure,Pokemon>> call(int id){
    return repository.getPokemon(id);
  } 
}