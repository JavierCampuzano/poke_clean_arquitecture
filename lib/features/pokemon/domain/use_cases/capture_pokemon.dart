import 'package:dartz/dartz.dart';
import 'package:poke_app/core/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';

class CapturePokemonUserCase {
  
  final PokemonsRepository repository;

  CapturePokemonUserCase({required this.repository});

  Future<Either<Failure, bool>> call(Pokemon pokemon){
    return repository.capturePokemon(pokemon);
  } 
}