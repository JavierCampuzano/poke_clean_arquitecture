import 'package:poke_app/features/pokemon/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon{
  PokemonModel({required super.id, required super.image, required super.name});
  
  factory PokemonModel.fromJson(json) {
    return PokemonModel(
        id: json['id'],
        image: json['sprites']['front_default'],
        name: json['name']);
  }

  Map<String,dynamic> toJson(){
    return{
      'id' : id,
      'sprites' : {
        'front_default' : image,
      },
      'name': name
    };
  }

  factory PokemonModel.fromEntity(Pokemon pokemon){
    return PokemonModel(id: pokemon.id, image: pokemon.image, name: pokemon.name);
  }

}