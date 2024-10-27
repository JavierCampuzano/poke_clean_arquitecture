import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/error/failures.dart';
import 'package:poke_app/core/utils/utils.dart' as utils;
import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/delete_pokemon.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/get_capture_pokemons.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/search_pokemon.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  final CapturePokemonUseCase _capturePokemonUseCase;
  final GetCapturePokemonsUseCase _getCapturePokemonsUseCase;
  final SearchPokemonUseCase _searchPokemonUseCase;
  final DeletePokemonUseCase _deletePokemonUseCase;

  SearchPokemonBloc(this._capturePokemonUseCase,
      this._getCapturePokemonsUseCase, this._searchPokemonUseCase,this._deletePokemonUseCase)
      : super(SearchPokemonInitial()) {
    on<OnSearchPokemon>(
      (event, emit) async {
        emit(SearchPokemonLoading());
        final responseSearchPokemon =
            await _searchPokemonUseCase(utils.randomPokemonId);
        responseSearchPokemon.fold(
            (f) => emit(SearchPokemonFailure(failure: f)),
            (p) => emit(SearchPokemonSuccess(pokemon: p)));
      },
    );

    on<OnCapturePokemon>(
      (event, emit) async {
        final responseCapturePokemon =
            await _capturePokemonUseCase(event.pokemon);

        responseCapturePokemon.fold(
            (f) => emit(SearchPokemonFailure(failure: f)), (p) {});
      },
    );

    on<OnGetCapturedPokemons>(
      (event, emit) async {
        final responseGetCapturePokemons = await _getCapturePokemonsUseCase();

        responseGetCapturePokemons.fold(
            (f) => emit(SearchPokemonFailure(failure: f)),
            (ps) => emit(SearchPokemonList(pokemons: ps)));
      },
    );
    on<OnDeletePokemon>(
      (event, emit) async {
        final responseDeletePokemon = await _deletePokemonUseCase(event.pokemons.last);

        responseDeletePokemon.fold(
            (f) => emit(SearchPokemonFailure(failure: f)),
            (ps){
              emit(SearchPokemonList(pokemons: ps));
            });
      },
    );
  }
}
