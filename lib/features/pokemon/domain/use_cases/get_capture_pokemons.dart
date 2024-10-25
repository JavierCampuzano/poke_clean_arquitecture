import 'package:dartz/dartz.dart';
import 'package:poke_app/core/error/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';

class GetCapturePokemonsUseCase {
    final PokemonsRepository repository;

  GetCapturePokemonsUseCase({required this.repository});

  Future<Either<Failure,List<Pokemon>>> call(){
    return repository.getAllCapturePokemon();
  }  
}