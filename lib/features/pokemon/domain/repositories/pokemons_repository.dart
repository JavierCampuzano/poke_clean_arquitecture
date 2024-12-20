import 'package:dartz/dartz.dart';
import 'package:poke_app/core/error/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';

abstract class PokemonsRepository{
  Future<Either<Failure,Pokemon>> getPokemon(int id);
  Future<Either<Failure,bool>> capturePokemon(Pokemon pokemon);
  Future<Either<Failure,List<Pokemon>>> getAllCapturePokemon();
  Future<Either<Failure,List<Pokemon>>> deletePokemon(Pokemon pokemon);
}