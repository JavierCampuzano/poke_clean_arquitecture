import 'package:flutter/material.dart';
import 'package:poke_app/core/error/failures.dart';
import 'package:poke_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PokemonsLocalDataSource {
  Future<bool> capturePokemon(Pokemon pokemon);
  Future<List<PokemonModel>> getCapturesPokemonList();
}

class HivePokemonLocalDataSourceImpl implements PokemonsLocalDataSource {

  HivePokemonLocalDataSourceImpl(){
    Hive.initFlutter();
  }


  @override
  Future<bool> capturePokemon(Pokemon pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());

      return true;
    } catch (error) {
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturesPokemonList() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      return box.values.map((pokemon) => PokemonModel.fromJson(pokemon)).toList();
    } catch (error) {
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }
  
}