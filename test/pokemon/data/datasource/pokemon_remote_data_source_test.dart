import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/features/pokemon/data/datasource/pokemons_local_data_source.dart';
import 'package:poke_app/features/pokemon/data/datasource/pokemons_remote_data_source.dart';
import 'package:poke_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:poke_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';

import 'mock_data/expected_pokemon_remote_datasource.dart';
import 'pokemon_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main(){
  late MockDio mockDio;

  late PokemonsRemoteDataSource pokemonsRemoteDataSource;
  setUp((){
    mockDio = MockDio();
    pokemonsRemoteDataSource = PokemonsRemoteDataSourceImpl();
  });

  RequestOptions requestOptions = RequestOptions();

  group("Test PokemonsRemoteDataSourceImpl", () {
    test("GetPokemon - succes", ()async{
      when(mockDio.get('https://pokeapi.co/api/v2/pokemon/1/')).thenAnswer((realInvocation)async{
        return Response(requestOptions: requestOptions);
      });
      dynamic result;
      try {
        result = (await pokemonsRemoteDataSource.getPokemon(1)).toJson();
      } catch (e) {
        result = PokemonModel(id: 0, image: "", name: "").toJson();
      }
      expect(result, expectedPokemonData);
    });
  });
}