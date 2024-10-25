import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:poke_app/core/error/failures.dart';
import 'package:poke_app/features/pokemon/data/datasource/pokemons_local_data_source.dart';
import 'package:poke_app/features/pokemon/data/datasource/pokemons_remote_data_source.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';

class PokemonRepositoryIml implements PokemonsRepository{

  final PokemonsLocalDataSource pokemonsLocalDataSource;
  final PokemonsRemoteDataSource pokemonsRemoteDataSource;

  PokemonRepositoryIml(
      {required this.pokemonsLocalDataSource,
      required this.pokemonsRemoteDataSource});

  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {
    try{
      final bool response = await pokemonsLocalDataSource.capturePokemon(pokemon);
      return Right(response);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getAllCapturePokemon() async{
    try {
      final List<Pokemon> response = await pokemonsLocalDataSource.getCapturesPokemonList();
      return Right(response);
    } on LocalFailure{
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    try {
      final Pokemon response = await pokemonsRemoteDataSource.getPokemon(id);
      return Right(response);
    }on DioException{
      return Left(ServerFailure());
    }
  }
  
}