import 'package:get_it/get_it.dart';
import 'package:poke_app/features/pokemon/data/datasource/pokemons_local_data_source.dart';
import 'package:poke_app/features/pokemon/data/datasource/pokemons_remote_data_source.dart';
import 'package:poke_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/delete_pokemon.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/get_capture_pokemons.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:poke_app/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Bloc

  di.registerFactory(
    () => SearchPokemonBloc(
      di(),
      di(),
      di(),
      di()
    ),
  );

  //Use cases
  di.registerLazySingleton(
    () => CapturePokemonUseCase(
      repository: di(),
    ),
  );
  di.registerLazySingleton(
    () => GetCapturePokemonsUseCase(
      repository: di(),
    ),
  );
  di.registerLazySingleton(
    () => SearchPokemonUseCase(
      repository: di(),
    ),
  );
  di.registerLazySingleton(
    () => DeletePokemonUseCase(
      repository: di(),
    ),
  );

  // Repositories
  di.registerLazySingleton<PokemonsRepository>(
    () => PokemonRepositoryIml(
      pokemonsLocalDataSource: di(),
      pokemonsRemoteDataSource: di(),
    ),
  );

  // Datasources 
  di.registerLazySingleton<PokemonsLocalDataSource>(
    () => HivePokemonLocalDataSourceImpl(),
  );

  di.registerLazySingleton<PokemonsRemoteDataSource>(
    () => PokemonsRemoteDataSourceImpl(),
  );
}
