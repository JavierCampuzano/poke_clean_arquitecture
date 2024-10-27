import 'package:dartz/dartz.dart';
import 'package:poke_app/core/error/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';

class DeletePokemonUseCase{
  
  final PokemonsRepository repository;

  DeletePokemonUseCase({required this.repository});

  Future<Either<Failure,List<Pokemon>>> call(Pokemon pokemon){
    return repository.deletePokemon(pokemon);
  }
}