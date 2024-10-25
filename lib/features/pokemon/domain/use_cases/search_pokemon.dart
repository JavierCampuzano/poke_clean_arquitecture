import 'package:dartz/dartz.dart';
import 'package:poke_app/core/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';

class SearchPokemon {
  final PokemonsRepository repository;

  SearchPokemon({required this.repository});

  Future<Either<Failure,Pokemon>> call(int id){
    return repository.getPokemon(id);
  } 
}